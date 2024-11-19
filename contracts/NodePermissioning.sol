// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NodePermissioning {
    mapping(address => bool) public allowedNodes;

    function addNode(address node) public {
        allowedNodes[node] = true;
    }

    function removeNode(address node) public {
        allowedNodes[node] = false;
    }

    function isNodeAllowed(address node) public view returns (bool) {
        return allowedNodes[node];
    }
}