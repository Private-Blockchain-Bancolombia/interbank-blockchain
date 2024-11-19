// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

contract NodeRules {
    address public adminAccount;
    mapping(string => bool) public allowedNodes;
    string[] public nodeList;

    event NodeAdded(string enodeURL);
    event NodeRemoved(string enodeURL);

    constructor() {
        adminAccount = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == adminAccount, "Only admin can perform this action");
        _;
    }

    function addNode(string calldata enodeURL) external onlyAdmin {
        require(!allowedNodes[enodeURL], "Node already exists");
        allowedNodes[enodeURL] = true;
        nodeList.push(enodeURL);
        emit NodeAdded(enodeURL);
    }

    function removeNode(string calldata enodeURL) external onlyAdmin {
        require(allowedNodes[enodeURL], "Node does not exist");
        allowedNodes[enodeURL] = false;
        
        // Remove from nodeList
        for (uint i = 0; i < nodeList.length; i++) {
            if (keccak256(bytes(nodeList[i])) == keccak256(bytes(enodeURL))) {
                // Move last element to this position and pop
                nodeList[i] = nodeList[nodeList.length - 1];
                nodeList.pop();
                break;
            }
        }
        
        emit NodeRemoved(enodeURL);
    }

    function getNodeList() external view returns (string[] memory) {
        return nodeList;
    }

    function nodePermitted(string calldata enodeURL) external view returns (bool) {
        return allowedNodes[enodeURL];
    }
}