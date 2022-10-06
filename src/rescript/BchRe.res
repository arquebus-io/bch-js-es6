let defaultRestApi = "https://api.fullstack.cash/v5/"
type libConfiguration = {
  restURL: string,
  apiToken: string,
  authToken: string,
}
@val @scope(("process", "env")) external envRestURL: option<string> = "RESTURL"
@val @scope(("process", "env")) external envApiToken: string = "BCHJSTOKEN"
@val @scope(("process", "env")) external envAuthPass: string = "BCHJSAUTHPASS"

type extModules =
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

external require: string => extModules = "require"
// @new external newElectrumxModule: libConfiguration => extModules = "electrumx"
// @new external newControlModule: libConfiguration => extModules = "control"
@new external newMiningModule: libConfiguration => extModules = "mining"
@new external newRawTransactionsModule: libConfiguration => extModules = "rawTransactions"
// @new external newAddressModule: libConfiguration => extModules = "address"
// @new external newBitcoinCashModule: libConfiguration => extModules = "bitcoinCash"
@new external newBlockchainModule: libConfiguration => extModules = "blockchain"
// @new external newCryptoModule: unit => extModules = "crypto"
// @new external newECPairModule: unit => extModules = "ECPair"
// @new external newEncryptionModule: libConfiguration => extModules = "encryption"
// @new external newGeneratingModule: libConfiguration => extModules = "generating"
// @new external newHDNodeModule: extModules => extModules = "HDNode"
// @new external newMnemonicModule: libConfiguration => extModules = "Mnemonic"
// @new external newPriceModule: libConfiguration => extModules = "price"
// @new external newScriptModule: libConfiguration => extModules = "script"
// @new external newTransactionBuilderModule: libConfiguration => extModules = "TransactionBuilder"
// @new external newUtilModule: libConfiguration => extModules = "util"
// @new external newSchnorrModule: libConfiguration => extModules = "schnorr"
// @new external newSLPModule: libConfiguration => extModules = "slp"
// @new external newUtxoModule: libConfiguration => extModules = "utxo"
// @new external newTransactionModule: libConfiguration => extModules = "transaction"
// @new external newDSProofModule: libConfiguration => extModules = "dsProof"
// @new external newECashModule: libConfiguration => extModules = "eCash"
// @new external newPsfSlpIndexerModule: libConfiguration => extModules = "psfSlpIndexer"
module Electrumx = {
  type t
external require: string => t = "require"
@new external newElectrumxModule: libConfiguration => t = "electrumx"
}

module Control = {
  type t
external require: string => t = "require"
@new external newControlModule: libConfiguration => t = "control"
}
module Address = {
  type t
  @new external newAddressModule: libConfiguration => t = "address"
}
module ECPair = {
  type t
external require: string => t = "require"
  @send
  external setAddress: (t, Address.t) => t = "setAddress"
  @new external newECPairModule: unit => t = "ecPair"
}
module HDNode = {
  type t
external require: string => t = "require"
  @new external newHDNodeModule: Address.t => t = "hdNode"
}
module Mnemonic = {
  type t
  @new external newMnemonicModule: Address.t => t = "mnemonic"
}
module TransactionBuilder = {
  type t
  @new external setAddress: Address.t => t = "transactionBuilder"
}
module BitcoinCash = {
  type t
@new external newBitcoinCashModule: Address.t => t = "bitcoinCash"
}
module Crypto = {
  type t
@new external newCryptoModule: unit => t = "crypto"
}
module Encryption = {
  type t
@new external newEncryptionModule: libConfiguration => t = "encryption"
}
module Generating = {
  type t
external require: string => t = "require"
@new external newGeneratingModule: libConfiguration => extModules = "generating"
}
module Price = {
  type t
@new external newPriceModule: libConfiguration => t = "price"
external require: string => t = "require"
}
module Script = {
  type t
external require: string => t = "require"
@new external newScriptModule: libConfiguration => t = "script"
}
module Util = {
  type t
external require: string => t = "require"
@new external newUtilModule: libConfiguration => t = "util"
}
module Schnorr = {
  type t
external require: string => t = "require"
@new external newSchnorrModule: libConfiguration => t = "schnorr"
}
module SLP = {
  type t
external require: string => t = "require"
@new external newSLPModule: libConfiguration => t = "slp"
}
module Utxo = {
  type t
external require: string => t = "require"
@new external newUtxoModule: libConfiguration => t = "utxo"
}
module Transaction = {
  type t
external require: string => t = "require"
@new external newTransactionModule: libConfiguration => t = "transaction"
}
module DSProof = {
  type t
external require: string => t = "require"
@new external newDSProofModule: libConfiguration => t = "dsProof"
}
module Ecash = {
  type t
external require: string => t = "require"
@new external newECashModule: libConfiguration => t = "eCash"
}
module PsfSlpIndexer = {
  type t
external require: string => t = "require"
@new external newPsfSlpIndexerModule: libConfiguration => t = "psfSlpIndexer"
}
let bitcoinCash = require("../bitcoincash")
let crypto = require("../crypto")
let util = Util.require("../util")
let blockchain = require("../blockchain")
let control = Control.require("../control")
let generating = require("../generating")
let mining = require("../mining")
let rawTransactions = require("../raw-transactions")
let mnemonic = require("../mnemonic")
let address = require("../address")
let hdNode = require("../hdnode")
let transactionBuilder = require("../transaction-builder")
let ecPair = ECPair.require("../ecpair")
let script = require("../script")
let price = Price.require("../price")
let schnorr = Schnorr.require("../schnorr")
let slp = SLP.require("../slp/slp")
let encryption = Generating.require("../encryption")
let utxo = Utxo.require("../utxo")
let transaction = Transaction.require("../transaction")
let dsProof = DSProof.require("../dsproof")
let eCash = Ecash.require("../ecash")
let electrumx = require("../electrumx")
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

// module Address = {
//   type t
//   @new external newAddressModule: libConfiguration => t = "address"
// }
// module ECPair = {
//   type t
//   @send
//   external setAddress: (t, Address.t) => t = "setAddress"
//   @new external newECPairModule: unit => t = "ecPair"
// }
// module HDNode = {
//   type t
//   @new external newHDNodeModule: Address.t => t = "hdNode"
// }
// module Mnemonic = {
//   type t
//   @new external newMnemonicModule: Address.t => t = "mnemonic"
// }
// module TransactionBuilder = {
//   type t
//   @new external setAddress: Address.t => t = "transactionBuilder"
// }
// module BitcoinCash = {
//   type t
// @new external newBitcoinCashModule: Address.t => t = "bitcoinCash"
// }
// module Crypto = {
//   type t
// external require: string => t = "require"
// @new external newCryptoModule: unit => t = "crypto"
// }

module BCHJS = {
  type t = {@as("Address") address: Address.t,
            @as("BitcoinCash") bitcoinCash :BitcoinCash.t,
            @as("Script") script: Script.t,
            @as("Crypto") crypto: extModules,
            @as("Util") util: Util.t,
            @as("Blockchain") blockchain: extModules,
            @as("Control") control: Control.t,
            @as("Generating") generating: extModules,
            @as("Mining") mining: extModules,
            @as("RawTransacations") rawTransactions: extModules,
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

    let electrumx = Electrumx.newElectrumxModule(libConfig)
    // Js.log(electrumx)
    let control = Control.newControlModule(libConfig)
    let mining = newMiningModule(libConfig)
    let rawTransactions = newRawTransactionsModule(libConfig)
    let address = Address.newAddressModule(libConfig)
    // Js.log2("Address module is: ", address)
    let blockchain = newBlockchainModule(libConfig)
    // let crypto = newCryptoModule()
    Js.log2("Crypto module is: ", crypto)
    // let ecPair = ECPair.newECPairModule()
    let encryption = Encryption.newEncryptionModule(libConfig)
    let generating = Generating.newGeneratingModule(libConfig)
    //let hdNode = newHDNodeModule(address)
    // let mnemonic = newMnemonicModule(libConfig)
    let price = Price.newPriceModule(libConfig)
    let script = Script.newScriptModule(libConfig)
    // Js.log2("Script module is: ", script)
    let util = Util.newUtilModule(libConfig)
    let schnorr = Schnorr.newSchnorrModule(libConfig)
    let slp = SLP.newSLPModule(libConfig)
    let utxo = Utxo.newUtxoModule(libConfig)
    let transaction = Transaction.newTransactionModule(libConfig)
    let dsProof = DSProof.newDSProofModule(libConfig)
    let ecash = Ecash.newECashModule(libConfig)
    let psfSlpIndexer = PsfSlpIndexer.newPsfSlpIndexerModule(libConfig)
    // Js.log2("Crypto module is: ", crypto)
    let ecPair = ecPair->ECPair.setAddress(address)
    let hdNode = HDNode.newHDNodeModule(address)
    let mnemonic = Mnemonic.newMnemonicModule(address)
    let transactionBuilder = TransactionBuilder.setAddress(address)
    let bitcoinCash = BitcoinCash.newBitcoinCashModule(address)
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
      eCash: eCash,
      electrumx: electrumx,
      psfSlpIndexer: psfSlpIndexer
    }
  }
}
