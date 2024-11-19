// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "./AccountRules.sol";
import "./NodeRules.sol";

contract PermissionsInterface {
    AccountRules public accountRules;
    NodeRules public nodeRules;
    address public adminAccount;
    
    constructor(address _accountRules, address _nodeRules) {
        accountRules = AccountRules(_accountRules);
        nodeRules = NodeRules(_nodeRules);
        adminAccount = msg.sender;
    }
    
    function accountPermitted(address account) external view returns (bool) {
        return accountRules.accountPermitted(account);
    }
    
    function nodePermitted(string calldata enodeURL) external view returns (bool) {
        return nodeRules.nodePermitted(enodeURL);
    }
}