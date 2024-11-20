// contracts/EURC.sol
pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract EURC is ERC20 {
    constructor(uint256 initialSupply) ERC20("Euro Coin", "EURC") {
        _mint(msg.sender, initialSupply);
    }
}