// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';


var defaultRestApi = "https://api.fullstack.cash/v5/";

var Address = {};

var ECPair = {};

var HDNode = {};

var Mnemonic = {};

var TransactionBuilder = {};

var BitcoinCash = {};

var $$Crypto = {};

var Encryption = {};

var Generating = {};

var Price = {};

var Script = {};

var Util = {};

var Schnorr = {};

var SLP = {};

var Utxo = {};

var Transaction = {};

var DSProof = {};

var Ecash = {};

var bitcoinCash = require("../bitcoincash");

var crypto = require("../crypto");

var util = require("../util");

var blockchain = require("../blockchain");

var control = require("../control");

var generating = require("../generating");

var mining = require("../mining");

var rawTransactions = require("../raw-transactions");

var mnemonic = require("../mnemonic");

var address = require("../address");

var hdNode = require("../hdnode");

var transactionBuilder = require("../transaction-builder");

var ecPair = require("../ecpair");

var script = require("../script");

var price = require("../price");

var schnorr = require("../schnorr");

var slp = require("../slp/slp");

var encryption = require("../encryption");

var utxo = require("../utxo");

var transaction = require("../transaction");

var dsProof = require("../dsproof");

var eCash = require("../ecash");

var electrumx = require("../electrumx");

var psfSlpIndexer = require("../psf-slp-indexer");

function make(config) {
  var restURL;
  if (config !== undefined) {
    restURL = config;
  } else {
    var url = process.env.RESTURL;
    restURL = url !== undefined ? url : defaultRestApi;
  }
  var apiToken = config !== undefined ? config : process.env.BCHJSTOKEN;
  var authPass = config !== undefined ? config : process.env.BCHJSAUTHPASS;
  var combined = "fullstackcash:" + authPass + "";
  var base64Credential = Buffer.from(combined).toString("base64");
  var authToken = "Basic " + base64Credential + "";
  var libConfig = {
    restURL: restURL,
    apiToken: apiToken,
    authToken: authToken
  };
  var electrumx$2 = new electrumx(libConfig);
  var control$2 = new control(libConfig);
  var mining$2 = new mining(libConfig);
  var rawTransactions$2 = new rawTransactions(libConfig);
  var address$2 = new address(libConfig);
  var blockchain$2 = new blockchain(libConfig);
  console.log("Crypto module is: ", crypto);
  var encryption$2 = new encryption(libConfig);
  var generating$2 = new generating(libConfig);
  var price$2 = new price(libConfig);
  var script$2 = new script(libConfig);
  var util$2 = new util(libConfig);
  var schnorr$2 = new schnorr(libConfig);
  var slp$2 = new slp(libConfig);
  var utxo$2 = new utxo(libConfig);
  var transaction$2 = new transaction(libConfig);
  var dsProof$2 = new dsProof(libConfig);
  new eCash(libConfig);
  var psfSlpIndexer$2 = new psfSlpIndexer(libConfig);
  var ecPair$1 = ecPair.setAddress(address$2);
  var hdNode$2 = new hdNode(address$2);
  var mnemonic$2 = new mnemonic(address$2);
  var transactionBuilder$2 = new transactionBuilder(address$2);
  var bitcoinCash$2 = new bitcoinCash(address$2);
  return {
          Address: address$2,
          BitcoinCash: bitcoinCash$2,
          Script: script$2,
          Crypto: crypto,
          Util: util$2,
          Blockchain: blockchain$2,
          Control: control$2,
          Generating: generating$2,
          Mining: mining$2,
          RawTransacations: rawTransactions$2,
          Mnemonic: mnemonic$2,
          HDNode: hdNode$2,
          TransactionBuilder: transactionBuilder$2,
          ECPair: ecPair$1,
          Price: price$2,
          Schnorr: schnorr$2,
          SLP: slp$2,
          Encryption: encryption$2,
          Utxo: utxo$2,
          Transaction: transaction$2,
          DSProof: dsProof$2,
          Ecash: eCash,
          Electrumx: electrumx$2,
          PsfSlpIndexer: psfSlpIndexer$2
        };
}

var BCHJS = {
  make: make
};

exports.defaultRestApi = defaultRestApi;
exports.Address = Address;
exports.ECPair = ECPair;
exports.HDNode = HDNode;
exports.Mnemonic = Mnemonic;
exports.TransactionBuilder = TransactionBuilder;
exports.BitcoinCash = BitcoinCash;
exports.$$Crypto = $$Crypto;
exports.Encryption = Encryption;
exports.Generating = Generating;
exports.Price = Price;
exports.Script = Script;
exports.Util = Util;
exports.Schnorr = Schnorr;
exports.SLP = SLP;
exports.Utxo = Utxo;
exports.Transaction = Transaction;
exports.DSProof = DSProof;
exports.Ecash = Ecash;
exports.bitcoinCash = bitcoinCash;
exports.crypto = crypto;
exports.util = util;
exports.blockchain = blockchain;
exports.control = control;
exports.generating = generating;
exports.mining = mining;
exports.rawTransactions = rawTransactions;
exports.mnemonic = mnemonic;
exports.address = address;
exports.hdNode = hdNode;
exports.transactionBuilder = transactionBuilder;
exports.ecPair = ecPair;
exports.script = script;
exports.price = price;
exports.schnorr = schnorr;
exports.slp = slp;
exports.encryption = encryption;
exports.utxo = utxo;
exports.transaction = transaction;
exports.dsProof = dsProof;
exports.eCash = eCash;
exports.electrumx = electrumx;
exports.psfSlpIndexer = psfSlpIndexer;
exports.BCHJS = BCHJS;
/* bitcoinCash Not a pure module */
