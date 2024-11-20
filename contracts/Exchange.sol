// contracts/Exchange.sol
pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Exchange {
    IERC20 public eurc;

    constructor(address eurcAddress) {
        eurc = IERC20(eurcAddress);
    }

    function exchangeToEURC(address fromToken, uint256 amount) external {
        IERC20(fromToken).transferFrom(msg.sender, address(this), amount);
        eurc.transfer(msg.sender, amount); // Simplified exchange logic
    }

    function exchangeFromEURC(address toToken, uint256 amount) external {
        eurc.transferFrom(msg.sender, address(this), amount);
        IERC20(toToken).transfer(msg.sender, amount); // Simplified exchange logic
    }
}