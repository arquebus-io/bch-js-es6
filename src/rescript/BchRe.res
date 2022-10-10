let defaultRestApi = "https://api.fullstack.cash/v5/"
type libConfiguration = {
  restURL: string,
  apiToken: string,
  authToken: string,
}
@val @scope(("process", "env")) external envRestURL: option<string> = "RESTURL"
@val @scope(("process", "env")) external envApiToken: string = "BCHJSTOKEN"
@val @scope(("process", "env")) external envAuthPass: string = "BCHJSAUTHPASS"

type modules =
  | BitcoinCash
  | Crypto
  | Util
  | Blockchain
  | Control
  | Generating
  | Mining
  | RawTransactions
  | Menmonic
  | Address
  | HDNode
  | TransactionBuilder
  | ECPair
  | Script
  | Price
  | Schnorr
  | SLP
  | Encryption
  | Utxo
  | Transaction
  | DSProof
  | Ecash
  | Electrumx
  | PsfSlpIndexer

external requireModule: (string, 'a) => 'a = "require"

let requireInternal = (modules, moduleType) => {
  switch modules {
  | BitcoinCash => requireModule("../bitcoincash", moduleType)
  | Crypto => requireModule("../crypto", moduleType)
  | Util => requireModule("../util", moduleType)
  | Blockchain => requireModule("../blockchain", moduleType)
  | Control => requireModule("../control", moduleType)
  | Generating => requireModule("../generating", moduleType)
  | Mining => requireModule("../mining", moduleType)
  | RawTransactions => requireModule("../raw-transaction", moduleType)
  | Menmonic => requireModule("../mnemonic", moduleType)
  | Address => requireModule("../address", moduleType)
  | HDNode => requireModule("../hdnode", moduleType)
  | TransactionBuilder => requireModule("../transaction-builder", moduleType)
  | ECPair => requireModule("../ecpair", moduleType)
  | Script => requireModule("../script", moduleType)
  | Price => requireModule("../price", moduleType)
  | Schnorr => requireModule("../schnorr", moduleType)
  | SLP => requireModule("../slp/slp", moduleType)
  | Encryption => requireModule("../ecryption", moduleType)
  | Utxo => requireModule("../utxo", moduleType)
  | Transaction => requireModule("../transaction", moduleType)
  | DSProof => requireModule("../dsproof", moduleType)
  | Ecash => requireModule("../ecash", moduleType)
  | Electrumx => requireModule("../electrumx", moduleType)
  | PsfSlpIndexer => requireModule("../psf-slp-indexer", moduleType)
  }
}

module Electrumx = {
  type t
  let require = (t) => {
    requireInternal(Electrumx, t)
  }
@new external new: libConfiguration => t = "electrumx"
}

module RawTransactions = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "rawTransactions"
}
module Control = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "control"
}
module Mining = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "mining"
}
module Address = {
  type t
external require: string => t = "require"
  @new external new: libConfiguration => t = "address"
}
module ECPair = {
  type t
external require: string => t = "require"
  @send
  external setAddress: (t, Address.t) => t = "setAddress"
  @new external new: unit => t = "ecPair"
}
module HDNode = {
  type t
external require: string => t = "require"
  @new external new: Address.t => t = "hdNode"
}
module Mnemonic = {
  type t
external require: string => t = "require"
  @new external new: Address.t => t = "mnemonic"
}
module TransactionBuilder = {
  type t
external require: string => t = "require"
  @new external setAddress: Address.t => t = "transactionBuilder"
}
module BitcoinCash = {
  type t
external require: string => t = "require"
@new external new: Address.t => t = "bitcoinCash"
}
module Blockchain = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "blockchain"
}
module Crypto = {
  type t
external require: string => t = "require"
@new external new: unit => t = "crypto"
}
module Encryption = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "encryption"
}
module Generating = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "generating"
}
module Price = {
  type t
@new external new: libConfiguration => t = "price"
external require: string => t = "require"
}
module Script = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "script"
}
module Util = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "util"
}
module Schnorr = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "schnorr"
}
module SLP = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "slp"
}
module Utxo = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "utxo"
}
module Transaction = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "transaction"
}
module DSProof = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "dsProof"
}
module Ecash = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "eCash"
}
module PsfSlpIndexer = {
  type t
external require: string => t = "require"
@new external new: libConfiguration => t = "psfSlpIndexer"
}


let bitcoinCash = BitcoinCash.require("../bitcoincash")
let crypto = Crypto.require("../crypto")
let util = Util.require("../util")
let blockchain = Blockchain.require("../blockchain")
let control = Control.require("../control")
let generating = Generating.require("../generating")
let mining = Mining.require("../mining")
let rawTransactions = RawTransactions.require("../raw-transactions")
let mnemonic = Mnemonic.require("../mnemonic")
let address = Address.require("../address")
let hdNode = HDNode.require("../hdnode")
let transactionBuilder = TransactionBuilder.require("../transaction-builder")
let ecPair = ECPair.require("../ecpair")
let script = Script.require("../script")
let price = Price.require("../price")
let schnorr = Schnorr.require("../schnorr")
let slp = SLP.require("../slp/slp")
let encryption = Generating.require("../encryption")
let utxo = Utxo.require("../utxo")
let transaction = Transaction.require("../transaction")
let dsProof = DSProof.require("../dsproof")
let eCash = Ecash.require("../ecash")
let electrumx = Electrumx.require()
let psfSlpIndexer = PsfSlpIndexer.require("../psf-slp-indexer")

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
  type t = {@as("Address") address: Address.t,
            @as("BitcoinCash") bitcoinCash :BitcoinCash.t,
            @as("Script") script: Script.t,
            @as("Crypto") crypto: Crypto.t,
            @as("Util") util: Util.t,
            @as("Blockchain") blockchain: Blockchain.t,
            @as("Control") control: Control.t,
            @as("Generating") generating: Generating.t,
            @as("Mining") mining: Mining.t,
            @as("RawTransacations") rawTransactions:RawTransactions.t,
            @as("Mnemonic") mnemonic: Mnemonic.t,
            @as("HDNode") hdNode: HDNode.t,
            @as("TransactionBuilder") transactionBuilder: TransactionBuilder.t,
            @as("ECPair") ecPair: ECPair.t,
            @as("Price") price: Price.t,
            @as("Schnorr") schnorr: Schnorr.t,
            @as("SLP") slp:SLP.t,
            @as("Encryption") encryption: Encryption.t,
            @as("Utxo") utxo: Utxo.t,
            @as("Transaction") transaction:Transaction.t,
            @as("DSProof") dsProof: DSProof.t,
            @as("Ecash") eCash: Ecash.t,
            @as("Electrumx") electrumx: Electrumx.t,
            @as("PsfSlpIndexer") psfSlpIndexer: PsfSlpIndexer.t}

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
      NodeJs.Buffer.fromString(combined)->NodeJs.Buffer.toStringWithEncoding(NodeJs.StringEncoding.base64)
    let authToken = `Basic ${base64Credential}`
    let libConfig = {
      restURL,
      apiToken,
      authToken,
    }

    let electrumx = Electrumx.new(libConfig)
    // Js.log(electrumx)
    let control = Control.new(libConfig)
    let mining = Mining.new(libConfig)
    let rawTransactions = RawTransactions.new(libConfig)
    let address = Address.new(libConfig)
    // Js.log2("Address module is: ", address)
    let blockchain = Blockchain.new(libConfig)
    // let crypto = newCryptoModule()
    Js.log2("Crypto module is: ", crypto)
    // let ecPair = ECPair.newECPairModule()
    let encryption = Encryption.new(libConfig)
    let generating = Generating.new(libConfig)
    //let hdNode = newHDNodeModule(address)
    // let mnemonic = newMnemonicModule(libConfig)
    let price = Price.new(libConfig)
    let script = Script.new(libConfig)
    // Js.log2("Script module is: ", script)
    let util = Util.new(libConfig)
    let schnorr = Schnorr.new(libConfig)
    let slp = SLP.new(libConfig)
    let utxo = Utxo.new(libConfig)
    let transaction = Transaction.new(libConfig)
    let dsProof = DSProof.new(libConfig)
    let ecash = Ecash.new(libConfig)
    let psfSlpIndexer = PsfSlpIndexer.new(libConfig)
    // Js.log2("Crypto module is: ", crypto)
    let ecPair = ecPair->ECPair.setAddress(address)
    let hdNode = HDNode.new(address)
    let mnemonic = Mnemonic.new(address)
    let transactionBuilder = TransactionBuilder.setAddress(address)
    let bitcoinCash = BitcoinCash.new(address)
    {
      address: address,
      bitcoinCash: bitcoinCash,
      script: script,
      crypto: crypto,
      util: util,
      blockchain: blockchain,
      control: control,
      generating: generating,
      mining: mining,
      rawTransactions: rawTransactions,
      mnemonic: mnemonic,
      hdNode: hdNode,
      transactionBuilder: transactionBuilder,
      ecPair: ecPair,
      price: price,
      schnorr: schnorr,
      slp: slp,
      encryption: encryption,
      utxo: utxo,
      transaction: transaction,
      dsProof: dsProof,
      eCash: ecash,
      electrumx: electrumx,
      psfSlpIndexer: psfSlpIndexer
    }
  }
}
