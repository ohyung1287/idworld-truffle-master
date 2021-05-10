const HDWalletProvider = require("truffle-hdwallet-provider");

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!

  networks: {
    // Ropsten public test network
    ropsten: {
      provider: function() {
        return new HDWalletProvider(
          "pluck vintage mechanic twenty fall maze valve pull portion lens quote slight",
          `https://ropsten.infura.io/v3/d807f40b095a4ba583000f09c5fea20e`
        );
      },
      from: "0x3F90a8a812e5D1F2fF3e949D1C0ca47F1fc8179d",
      gas: 2000000,
      gasPrice: 25000000,
      network_id: 3
    },
    // Ganache local testing
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "5777" // Match any network id
    }
  },
  solc: {
    optimizer: {
      enable: true,
      runs: 200
    }
  }
  // networks: { // Ropsten testing network
  // 	development: {
  // 		host: "127.0.0.1",
  // 		port: 8545,
  // 		network_id: "*" // Match any network id
  // 	},
  // 	ropsten: {
  // 		network_id: 3,
  // 		host: "127.0.0.1",
  // 		port: 8545,
  // 		gas: 2900000
  // 	}
  // },
  // rpc: {
  // 	host: "localhost",
  // 	post:8080
  // }
};
