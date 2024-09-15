let defaultRestApi = "https://api.fullstack.cash/v5/"
type libConfiguration = {
  restURL: string,
  apiToken: string,
  authToken: string,
}
@val @scope(("process", "env")) external envRestURL: option<string> = "RESTURL"
@val @scope(("process", "env")) external envApiToken: string = "BCHJSTOKEN"
@val @scope(("process", "env")) external envAuthPass: string = "BCHJSAUTHPASS"

module Electrumx = {
  type t

  @module @new external new: libConfiguration => t = "../electrumx"
}

module RawTransactions = {
  type t
  @module @new external new: libConfiguration => t = "../raw-transactions"
}
module Control = {
  type t
  @module @new external new: libConfiguration => t = "../control"
}
module Mining = {
  type t
  @module @new external new: libConfiguration => t = "../mining"
}
module Address = {
  type t
  @module @new external new: libConfiguration => t = "../address"
}
module ECPair = {
  type t
  external require: string => t = "require"
  @send
  external setAddress: (t, Address.t) => unit = "setAddress"
}
module HDNode = {
  type t
  @module @new external new: Address.t => t = "../hdnode"
}
module Mnemonic = {
  type t
  @module @new external new: Address.t => t = "../mnemonic"
}
module TransactionBuilder = {
  type t
  external require: string => t = "require"
  @send external setAddress: (t, Address.t) => unit = "setAddress"
}
module BitcoinCash = {
  type t
  @module @new external new: Address.t => t = "../bitcoincash"
}
module Blockchain = {
  type t
  @module @new external new: libConfiguration => t = "../blockchain"
}
module Crypto = {
  type t
  external require: string => t = "require"
}
module Encryption = {
  type t
  @module @new external new: libConfiguration => t = "../encryption"
}
module Generating = {
  type t
  @module @new external new: libConfiguration => t = "../generating"
}
module Price = {
  type t
  @module @new external new: libConfiguration => t = "../price"
}
module Script = {
  type t
  @module @new external new: unit => t = "../script"
}
module Util = {
  type t
  @module @new external new: libConfiguration => t = "../util"
}
module Schnorr = {
  type t
  @module @new external new: libConfiguration => t = "../schnorr"
}
module SLP = {
  type t
  @module @new external new: libConfiguration => t = "../slp/slp"
  module HDNode = {
    type t
  }
}
module Utxo = {
  type t
  @module @new external new: libConfiguration => t = "../utxo"
}
module Transaction = {
  type t
  @module @new external new: libConfiguration => t = "../transaction"
}
module DSProof = {
  type t
  @module @new external new: libConfiguration => t = "../dsproof"
}
module Ecash = {
  type t
  @module @new external new: unit => t = "../ecash"
}
module PsfSlpIndexer = {
  type t
  @module @new external new: libConfiguration => t = "../psf-slp-indexer"
}

type restURL = string
type apiToken
type authPass
type authToken
type environment = {@as("RESTURL") restURL: restURL}
type process = {env: environment}
type configurationObject = {
  restURL: option<restURL>,
  apiToken: option<apiToken>,
  authPass: option<authPass>,
  authToken: option<authToken>,
}
type configuration = option<configurationObject>

module BCHJS = {
  type t = {
    @as("Address") address: Address.t,
    @as("BitcoinCash") bitcoinCash: BitcoinCash.t,
    @as("Script") script: Script.t,
    @as("Crypto") crypto: Crypto.t,
    @as("Util") util: Util.t,
    @as("Blockchain") blockchain: Blockchain.t,
    @as("Control") control: Control.t,
    @as("Generating") generating: Generating.t,
    @as("Mining") mining: Mining.t,
    @as("RawTransacations") rawTransactions: RawTransactions.t,
    @as("Mnemonic") mnemonic: Mnemonic.t,
    @as("HDNode") hdNode: HDNode.t,
    @as("TransactionBuilder") transactionBuilder: TransactionBuilder.t,
    @as("ECPair") ecPair: ECPair.t,
    @as("Price") price: Price.t,
    @as("Schnorr") schnorr: Schnorr.t,
    @as("SLP") slp: SLP.t,
    @as("Encryption") encryption: Encryption.t,
    @as("Utxo") utxo: Utxo.t,
    @as("Transaction") transaction: Transaction.t,
    @as("DSProof") dsProof: DSProof.t,
    @as("Ecash") eCash: Ecash.t,
    @as("Electrumx") electrumx: Electrumx.t,
    @as("PsfSlpIndexer") psfSlpIndexer: PsfSlpIndexer.t,
  }

  let make = config => {
    let restURL = switch config {
    | Some(url) => url
    | None =>
      switch envRestURL {
      | Some(url) => url
      | None => defaultRestApi
      }
    }
    let apiToken = switch config {
    | Some(token) => token
    | None => envApiToken
    }
    let authPass = switch config {
    | Some(pass) => pass
    | None => envAuthPass
    }
    let combined = `fullstackcash:${authPass}`

    let base64Credential =
      NodeJs.Buffer.fromString(combined)->NodeJs.Buffer.toStringWithEncoding(
        NodeJs.StringEncoding.base64,
      )
    let authToken = `Basic ${base64Credential}`
    let libConfig = {
      restURL,
      apiToken,
      authToken,
    }

    let electrumx = Electrumx.new(libConfig)
    let control = Control.new(libConfig)
    let mining = Mining.new(libConfig)
    let rawTransactions = RawTransactions.new(libConfig)
    let address = Address.new(libConfig)
    let bitcoinCash = BitcoinCash.new(address)
    let blockchain = Blockchain.new(libConfig)
    let crypto = Crypto.require("../crypto")
    let ecPair = ECPair.require("../ecpair")
    ecPair->ECPair.setAddress(address)
    let encryption = Encryption.new(libConfig)
    let generating = Generating.new(libConfig)
    let hdNode = HDNode.new(address)
    let mnemonic = Mnemonic.new(address)
    let price = Price.new(libConfig)
    let script = Script.new()
    let transactionBuilder = TransactionBuilder.require("../transaction-builder")
    transactionBuilder->TransactionBuilder.setAddress(address)
    let util = Util.new(libConfig)
    let schnorr = Schnorr.new(libConfig)
    let slp = SLP.new(libConfig)
    let utxo = Utxo.new(libConfig)
    let transaction = Transaction.new(libConfig)
    let dsProof = DSProof.new(libConfig)
    let ecash = Ecash.new()
    let psfSlpIndexer = PsfSlpIndexer.new(libConfig)
    {
      address,
      bitcoinCash,
      script,
      crypto,
      util,
      blockchain,
      control,
      generating,
      mining,
      rawTransactions,
      mnemonic,
      hdNode,
      transactionBuilder,
      ecPair,
      price,
      schnorr,
      slp,
      encryption,
      utxo,
      transaction,
      dsProof,
      eCash: ecash,
      electrumx,
      psfSlpIndexer,
    }
  }
}
