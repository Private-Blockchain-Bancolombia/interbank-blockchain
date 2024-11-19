const AccountRules = artifacts.require("AccountRules");
const NodeRules = artifacts.require("NodeRules");
const PermissionsInterface = artifacts.require("PermissionsInterface");

module.exports = async function(deployer) {
  // Deploy AccountRules contract
  // await deployer.deploy(AccountRules);
  // const accountRules = await AccountRules.deployed();

  // // Deploy NodeRules contract
  // await deployer.deploy(NodeRules);
  // const nodeRules = await NodeRules.deployed();

  // // Deploy PermissionsInterface contract with the addresses of the deployed AccountRules and NodeRules contracts
  // await deployer.deploy(PermissionsInterface, accountRules.address, nodeRules.address);
};