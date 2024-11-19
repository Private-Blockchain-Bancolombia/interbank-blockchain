const { ethers } = require('ethers');
const fs = require('fs');
const path = require('path');

const privateKey = "0x8f2a55949038a9610f50fb23b5883af3b4ecb3c3bb792cbcefbd1542c692be63";

const contractName = "NodePermissioning";

const blockchainUrl = 'http://172.20.0.3:8545'

const contractJsonPath = path.resolve(__dirname, `../artifacts/${contractName}.json`);
const contractJson = JSON.parse(fs.readFileSync(contractJsonPath));
const contractAbi = contractJson.abi;
const contractBinPath = path.resolve(__dirname, `../build/${contractName}/${contractName}.bin`);
const contractBin = fs.readFileSync(contractBinPath);

// Define provider (replace with your provider)
const provider = new ethers.providers.JsonRpcProvider(blockchainUrl);

// Create wallet instance
const wallet = new ethers.Wallet(privateKey, provider);

const contractConstructorInit = "000000000000000000000000000000000000000000000000000000000000002F";

// Define transaction
const tx = {
    nonce: null, //nonce value
    from: "fe3b557e8fb62b89f4916b721be55ceb828dbd73",
    to: null, //public tx
    value: "0x00",
    data: "0x" + contractBin + contractConstructorInit, // contract binary appended with initialization value
    gasPrice: "0x0", //ETH per unit of gas
    gasLimit: 30000, //max number of gas units the tx is allowed to use
};

// Sign the transaction
async function signTransaction() {
    const signedTx = await wallet.signTransaction(tx);
    console.log('Signed Transaction:', signedTx);
}

signTransaction();