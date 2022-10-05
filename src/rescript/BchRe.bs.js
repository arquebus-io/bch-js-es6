// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';


var defaultRestApi = "https://api.fullstack.cash/v5/";

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

var Address = {};

var ECPair = {};

var HDNode = {};

var Mnemonic = {};

var TransactionBuilder = {};

var BitcoinCash = {};

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
  new electrumx(libConfig);
  new control(libConfig);
  new mining(libConfig);
  new rawTransactions(libConfig);
  var address$2 = new address(libConfig);
  new blockchain(libConfig);
  new crypto();
  new encryption(libConfig);
  new generating(libConfig);
  new price(libConfig);
  var script$2 = new script(libConfig);
  new util(libConfig);
  new schnorr(libConfig);
  new slp(libConfig);
  new utxo(libConfig);
  new transaction(libConfig);
  new dsProof(libConfig);
  new eCash(libConfig);
  new psfSlpIndexer(libConfig);
  ecPair.setAddress(address$2);
  new hdNode(address$2);
  new mnemonic(address$2);
  new transactionBuilder(address$2);
  var bitcoinCash$2 = new bitcoinCash(address$2);
  return {
          Address: address$2,
          BitcoinCash: bitcoinCash$2,
          Script: script$2
        };
}

var BCHJS = {
  make: make
};

exports.defaultRestApi = defaultRestApi;
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
exports.Address = Address;
exports.ECPair = ECPair;
exports.HDNode = HDNode;
exports.Mnemonic = Mnemonic;
exports.TransactionBuilder = TransactionBuilder;
exports.BitcoinCash = BitcoinCash;
exports.BCHJS = BCHJS;
/* bitcoinCash Not a pure module */
