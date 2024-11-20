const Web3 = require('web3');
const web3 = new Web3('http://localhost:8545'); // Replace with your RPC URL

const EURC = require('./build/contracts/EURC.json');
const Exchange = require('./build/contracts/Exchange.json');

const eurcAddress = '0x...'; // Deployed EURC contract address
const exchangeAddress = '0x...'; // Deployed Exchange contract address

const eurc = new web3.eth.Contract(EURC.abi, eurcAddress);
const exchange = new web3.eth.Contract(Exchange.abi, exchangeAddress);

async function exchangeToEURC(fromTokenAddress, amount, fromAddress) {
    await exchange.methods.exchangeToEURC(fromTokenAddress, amount).send({ from: fromAddress });
}

async function exchangeFromEURC(toTokenAddress, amount, fromAddress) {
    await exchange.methods.exchangeFromEURC(toTokenAddress, amount).send({ from: fromAddress });
}

// Test
exchangeToEURC(eurcAddress, 100, '0x...');
exchangeFromEURC(eurcAddress, 100, '0x...');
