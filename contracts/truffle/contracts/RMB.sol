pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RMB is ERC20 {
    constructor(uint256 initialSupply) ERC20("Chinese Yuan", "RMB") {
        _mint(msg.sender, initialSupply);
    }
}