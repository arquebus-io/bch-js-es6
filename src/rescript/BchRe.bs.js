// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Util = require("../util");
var Utxo = require("../utxo");
var Ecash = require("../ecash");
var Price = require("../price");
var Hdnode = require("../hdnode");
var Mining = require("../mining");
var Script = require("../script");
var Address = require("../address");
var Control = require("../control");
var Dsproof = require("../dsproof");
var Schnorr = require("../schnorr");
var Slp = require("../slp/slp");
var Mnemonic = require("../mnemonic");
var Electrumx = require("../electrumx");
var Blockchain = require("../blockchain");
var Encryption = require("../encryption");
var Generating = require("../generating");
var Bitcoincash = require("../bitcoincash");
var Transaction = require("../transaction");
var PsfSlpIndexer = require("../psf-slp-indexer");
var RawTransactions = require("../raw-transactions");

var defaultRestApi = "https://api.fullstack.cash/v5/";

function $$new(prim) {
  return new Electrumx(prim);
}

var Electrumx$1 = {
  $$new: $$new
};

function $$new$1(prim) {
  return new RawTransactions(prim);
}

var RawTransactions$1 = {
  $$new: $$new$1
};

function $$new$2(prim) {
  return new Control(prim);
}

var Control$1 = {
  $$new: $$new$2
};

function $$new$3(prim) {
  return new Mining(prim);
}

var Mining$1 = {
  $$new: $$new$3
};

function $$new$4(prim) {
  return new Address(prim);
}

var Address$1 = {
  $$new: $$new$4
};

var ECPair = {};

function $$new$5(prim) {
  return new Hdnode(prim);
}

var HDNode = {
  $$new: $$new$5
};

function $$new$6(prim) {
  return new Mnemonic(prim);
}

var Mnemonic$1 = {
  $$new: $$new$6
};

var TransactionBuilder = {};

function $$new$7(prim) {
  return new Bitcoincash(prim);
}

var BitcoinCash = {
  $$new: $$new$7
};

function $$new$8(prim) {
  return new Blockchain(prim);
}

var Blockchain$1 = {
  $$new: $$new$8
};

var $$Crypto = {};

function $$new$9(prim) {
  return new Encryption(prim);
}

var Encryption$1 = {
  $$new: $$new$9
};

function $$new$10(prim) {
  return new Generating(prim);
}

var Generating$1 = {
  $$new: $$new$10
};

function $$new$11(prim) {
  return new Price(prim);
}

var Price$1 = {
  $$new: $$new$11
};

function $$new$12(prim) {
  return new Script();
}

var Script$1 = {
  $$new: $$new$12
};

function $$new$13(prim) {
  return new Util(prim);
}

var Util$1 = {
  $$new: $$new$13
};

function $$new$14(prim) {
  return new Schnorr(prim);
}

var Schnorr$1 = {
  $$new: $$new$14
};

function $$new$15(prim) {
  return new Slp(prim);
}

var HDNode$1 = {};

var SLP = {
  $$new: $$new$15,
  HDNode: HDNode$1
};

function $$new$16(prim) {
  return new Utxo(prim);
}

var Utxo$1 = {
  $$new: $$new$16
};

function $$new$17(prim) {
  return new Transaction(prim);
}

var Transaction$1 = {
  $$new: $$new$17
};

function $$new$18(prim) {
  return new Dsproof(prim);
}

var DSProof = {
  $$new: $$new$18
};

function $$new$19(prim) {
  return new Ecash();
}

var Ecash$1 = {
  $$new: $$new$19
};

function $$new$20(prim) {
  return new PsfSlpIndexer(prim);
}

var PsfSlpIndexer$1 = {
  $$new: $$new$20
};

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
  var electrumx = new Electrumx(libConfig);
  var control = new Control(libConfig);
  var mining = new Mining(libConfig);
  var rawTransactions = new RawTransactions(libConfig);
  var address = new Address(libConfig);
  var bitcoinCash = new Bitcoincash(address);
  var blockchain = new Blockchain(libConfig);
  var crypto = require("../crypto");
  var ecPair = require("../ecpair");
  ecPair.setAddress(address);
  var encryption = new Encryption(libConfig);
  var generating = new Generating(libConfig);
  var hdNode = new Hdnode(address);
  var mnemonic = new Mnemonic(address);
  var price = new Price(libConfig);
  var script = new Script();
  var transactionBuilder = require("../transaction-builder");
  transactionBuilder.setAddress(address);
  var util = new Util(libConfig);
  var schnorr = new Schnorr(libConfig);
  var slp = new Slp(libConfig);
  var utxo = new Utxo(libConfig);
  var transaction = new Transaction(libConfig);
  var dsProof = new Dsproof(libConfig);
  var ecash = new Ecash();
  var psfSlpIndexer = new PsfSlpIndexer(libConfig);
  return {
          Address: address,
          BitcoinCash: bitcoinCash,
          Script: script,
          Crypto: crypto,
          Util: util,
          Blockchain: blockchain,
          Control: control,
          Generating: generating,
          Mining: mining,
          RawTransacations: rawTransactions,
          Mnemonic: mnemonic,
          HDNode: hdNode,
          TransactionBuilder: transactionBuilder,
          ECPair: ecPair,
          Price: price,
          Schnorr: schnorr,
          SLP: slp,
          Encryption: encryption,
          Utxo: utxo,
          Transaction: transaction,
          DSProof: dsProof,
          Ecash: ecash,
          Electrumx: electrumx,
          PsfSlpIndexer: psfSlpIndexer
        };
}

var BCHJS = {
  make: make
};

exports.defaultRestApi = defaultRestApi;
exports.Electrumx = Electrumx$1;
exports.RawTransactions = RawTransactions$1;
exports.Control = Control$1;
exports.Mining = Mining$1;
exports.Address = Address$1;
exports.ECPair = ECPair;
exports.HDNode = HDNode;
exports.Mnemonic = Mnemonic$1;
exports.TransactionBuilder = TransactionBuilder;
exports.BitcoinCash = BitcoinCash;
exports.Blockchain = Blockchain$1;
exports.$$Crypto = $$Crypto;
exports.Encryption = Encryption$1;
exports.Generating = Generating$1;
exports.Price = Price$1;
exports.Script = Script$1;
exports.Util = Util$1;
exports.Schnorr = Schnorr$1;
exports.SLP = SLP;
exports.Utxo = Utxo$1;
exports.Transaction = Transaction$1;
exports.DSProof = DSProof;
exports.Ecash = Ecash$1;
exports.PsfSlpIndexer = PsfSlpIndexer$1;
exports.BCHJS = BCHJS;
/* ../util Not a pure module */