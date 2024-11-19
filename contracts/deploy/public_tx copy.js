const { Web3 } = require('web3');
const fs = require('fs-extra');
const path = require('path');

const blockchainIp = "http://172.20.0.3:8545";

const privateKey =
  "0x8f2a55949038a9610f50fb23b5883af3b4ecb3c3bb792cbcefbd1542c692be63";

const contracts = [
    "NodePermissioning",
    // "AccountPermissioning",
]



async function deployContract(contractName, privateKey, blockchainIp) {
    const web3 = new Web3(blockchainIp);
    const account = web3.eth.accounts.privateKeyToAccount(privateKey);

    // read in the contracts
    const contractJsonPath = path.resolve(__dirname, `../artifacts/${contractName}.json`);
    const contractJson = JSON.parse(fs.readFileSync(contractJsonPath));
    const contractAbi = contractJson.abi;
    const contractBinPath = path.resolve(__dirname, `../build/${contractName}/${contractName}.bin`);
    const contractBin = fs.readFileSync(contractBinPath);

    // initialize the default constructor with a value `47 = 0x2F`; this value is appended to the bytecode
    const contractConstructorInit = "000000000000000000000000000000000000000000000000000000000000002F";

    // get txnCount for the nonce value
    const txnCount = await web3.eth.getTransactionCount(account.address);

    // Estimate gas 
    const gasEstimate = await web3.eth.estimateGas({
        from: account.address,
        data: "0x" + contractBin + contractConstructorInit,
    });

    const rawTxOptions = {
        nonce: web3.utils.numberToHex(txnCount),
        from: account.address,
        to: null, //public tx
        value: "0x00",
        data: "0x" + contractBin + contractConstructorInit, // contract binary appended with initialization value
        gasPrice: "0x0", //ETH per unit of gas
        gasLimit: web3.utils.toHex(gasEstimate), //max number of gas units the tx is allowed to use
    };

    console.log(`- Creating transaction and signing transaction for ${contractName} contract\n`);
    const signedTx = await web3.eth.accounts.signTransaction(rawTxOptions, privateKey);

    console.log(`- Sending signed transaction for ${contractName} contract\n`);
    const txReceipt = await web3.eth.sendSignedTransaction(signedTx.rawTransaction);

    console.log(`\n- Transaction receipt for ${contractName} contract:\n    tx transactionHash: ${txReceipt.transactionHash}\n    tx contractAddress: ${txReceipt.contractAddress}\n`); 
    return txReceipt;
}

contracts.forEach(contractName => { 
    console.log(`Deploying ${contractName} contract:\n`);
    deployContract(contractName, privateKey, blockchainIp).then(() => 
        process.exit(0)
    ).catch((err) => {
        console.error(err);
        process.exit(1);
    });
});