// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

contract AccountRules {
    address public adminAccount;
    mapping(address => bool) public allowlist;
    
    event AccountAdded(address account);
    event AccountRemoved(address account);
    
    constructor() {
        adminAccount = msg.sender;
        // Add the deployer to the allowlist
        allowlist[msg.sender] = true;
    }
    
    modifier onlyAdmin() {
        require(msg.sender == adminAccount, "Only admin can perform this action");
        _;
    }
    
    function addAccount(address account) external onlyAdmin {
        require(!allowlist[account], "Account already exists");
        allowlist[account] = true;
        emit AccountAdded(account);
    }
    
    function removeAccount(address account) external onlyAdmin {
        require(allowlist[account], "Account does not exist");
        require(account != adminAccount, "Cannot remove admin account");
        allowlist[account] = false;
        emit AccountRemoved(account);
    }
    
    function accountPermitted(address account) external view returns (bool) {
        return allowlist[account];
    }
}