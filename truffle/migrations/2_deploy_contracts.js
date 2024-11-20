const Web3 = require('web3');
const EURC = artifacts.require("EURC");
const Exchange = artifacts.require("Exchange");

const web3 = new Web3('http://172.20.0.3:8545'); 

module.exports = async function(deployer) {
    await deployer.deploy(EURC, web3.utils.toWei('1000000', 'ether')); // Initial supply of 1,000,000 EURC
    const eurc = await EURC.deployed();
    await deployer.deploy(Exchange, eurc.address);
};