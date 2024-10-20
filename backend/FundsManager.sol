
// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import  {Projects} from "./Projects.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract FundsManager is Projects {

    address public erc20Token;
    address public threasureAccount;

    event FundsTransferred(address indexed receiver, uint256 amount);

    constructor(address _erc20Token, address initialOwnerAndAdmin)  Projects(initialOwnerAndAdmin) {
        require(_erc20Token != address(0), "Invalid ERC20 address");
        erc20Token = _erc20Token;
        threasureAccount = initialOwnerAndAdmin;
    }

    function setThreasureAccount(address newThreasureAccount) external onlyAdministratorOrOwner {
        threasureAccount = newThreasureAccount;
    }

    function hasEnoughBalanceToPayFor(uint projectId) internal view returns (bool) {
        IERC20 token = IERC20(erc20Token);
        uint256 balance = token.balanceOf(address(this));
        return balance >= getProjectBudget(projectId);
    }

    function _withdrawProject(uint projectId) internal onlyValidId(projectId)  {
        require(isProjectApproved(projectId), "Only Approved Projects can be funded.");
        require(hasEnoughBalanceToPayFor(projectId), "Insufficient balance");
        IERC20 token = IERC20(erc20Token);
        require(token.transfer(threasureAccount, getProjectBudget(projectId)), "Withdrawal failed");
        emit FundsTransferred(threasureAccount, getProjectBudget(projectId));
        
    }
}
