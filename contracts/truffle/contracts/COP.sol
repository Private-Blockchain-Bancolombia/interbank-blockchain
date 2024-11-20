pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract COP is ERC20 {
    constructor(uint256 initialSupply) ERC20("Colombian Peso", "COP") {
        _mint(msg.sender, initialSupply);
    }
}