//require('dotenv').config();
const Web3 = require("web3");
const web3 = new Web3();
const WalletProvider = require("truffle-wallet-provider");
const Wallet = require("ethereumjs-wallet");

var key = new Buffer("", "hex");
var wallet = Wallet.fromPrivateKey(key);
var provider = new WalletProvider(wallet, "http://localhost:8545");


module.exports = {
  networks: {
    development: {
      provider:provider,
      host: "localhost",
      port: 8545,
      network_id: "*", // Match any network id,
      gas: 3000000
    },
    live: {
      host: "localhost",
      port: 8545,
      network_id: 1        // Ethereum public network
    }
  }
};