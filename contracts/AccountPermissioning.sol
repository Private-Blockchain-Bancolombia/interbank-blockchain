// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccountPermissioning {
    mapping(address => bool) public allowedAccounts;

    function addAccount(address account) public {
        allowedAccounts[account] = true;
    }

    function removeAccount(address account) public {
        allowedAccounts[account] = false;
    }

    function isAccountAllowed(address account) public view returns (bool) {
        return allowedAccounts[account];
    }
}