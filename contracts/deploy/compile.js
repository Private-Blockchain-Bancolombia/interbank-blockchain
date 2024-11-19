const fs = require("fs").promises;
const solc = require("solc");

const contracts = [
    "NodePermissioning",
    "AccountPermissioning",
]

async function main(contractName) {
  // Load the contract source code
  const sourceCode = await fs.readFile(`contracts/${contractName}.sol`, "utf-8");
  // Compile the source code and retrieve the ABI and bytecode
  const { abi, bytecode } = compile(sourceCode, contractName);
  // Store the ABI and bytecode into a JSON file
  const artifact = JSON.stringify({ abi, bytecode }, null, 2);
  await fs.writeFile(`contracts/artifacts/${contractName}.json`, artifact);
}

function compile(sourceCode, contractName) {
  // Create the Solidity Compiler Standard Input and Output JSON
  const input = {
    language: "Solidity",
    sources: { main: { content: sourceCode } },
    settings: { outputSelection: { "*": { "*": ["abi", "evm.bytecode"] } } },
  };
  // Parse the compiler output to retrieve the ABI and bytecode
  const output = solc.compile(JSON.stringify(input));
  const artifact = JSON.parse(output).contracts.main[contractName];
  return {
    abi: artifact.abi,
    bytecode: artifact.evm.bytecode.object,
  };
}

contracts.forEach(contractName => { main(contractName).then(() => process.exit(0)); });