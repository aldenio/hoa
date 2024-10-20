
// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import  {Polls} from "./Polls.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract FundsManager is Polls {

    address public erc20Token;
    uint256 public threshold;

    event FundsTransferred(address indexed receiver, uint256 amount);

    constructor(address _erc20Token, address initialOwnerAndAdmin)  Polls(initialOwnerAndAdmin) {
        require(_erc20Token != address(0), "Invalid ERC20 address");
        erc20Token = _erc20Token;
    }

    function checkAndTransfer(address receiver) external {
        // require(msg.sender == owner, "Only the owner can execute this");
        require(receiver != address(0), "Invalid receiver address");

        IERC20 token = IERC20(erc20Token);
        uint256 balance = token.balanceOf(address(this));

        if (balance >= threshold) {
            require(token.transfer(receiver, balance), "Transfer failed");
            emit FundsTransferred(receiver, balance);
        }
    }

    // Optional: Allow the owner to withdraw funds manually
    function withdraw(uint projectId) external {
        // require(msg.sender == owner, "Only the owner can withdraw");
        IERC20 token = IERC20(erc20Token);
        require(token.transfer(owner, amount), "Withdrawal failed");
    }
}
