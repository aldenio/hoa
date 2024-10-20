
// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import {FundsManager} from "./FundsManager.sol";

contract Polls is FundsManager {

    mapping (uint => bool[]) public votes;
    mapping (uint => address[]) public whoVoted;

    error AlreadyVotedForThisProject(address, uint);

    constructor(address _erc20Token)  FundsManager(_erc20Token, msg.sender) {
    }

    function startPoll(string calldata _name, string calldata _description, uint _budget) external onlyAdministrator {
        uint projectId = _addProject(_name, _description, _budget);
        whoVoted[projectId] = new address[](0);
        votes[projectId] = new bool[](0);
    }

    function cancelPoll(uint projectId) external onlyAdministrator {
        _declineProject(projectId);
    }
    
    function submitVote(uint projectId, bool vote) external onlyBoardMembers  {  // submit vote for the project 
        require(isProjectActive(projectId), InvalidProjectStatus(projectId));
        if (hasMemberAlreadyVoted(projectId, msg.sender)) {
            revert AlreadyVotedForThisProject(msg.sender, projectId);
        }
        votes[projectId].push(vote);  
        whoVoted[projectId].push(msg.sender);

        if (_allBoardHasVoted(projectId)){
            if (_wasProjectUnanimousVotedYes(projectId)){
                _approveProject(projectId);
                _withdrawProject(projectId);
            } else {
                _rejectProject(projectId);
            }
        }
    }

    function hasMemberAlreadyVoted(uint projectId, address voter) public view returns (bool){
        for (uint i = 0; i < whoVoted[projectId].length; i++) {
            if (whoVoted[projectId][i] == voter) {
               return true;
            }
        }
        return false;
    }

    function _allBoardHasVoted(uint projectId) internal view returns (bool){
        return votes[projectId].length >= getBoardSize();
    }
    function _wasProjectUnanimousVotedYes(uint projectId) internal view returns (bool)  {
        if (votes[projectId].length < getBoardSize()) return false;
        for (uint i=0; i<votes[projectId].length; i++) {
            if (votes[projectId][i] == false) {
                return false;
            }
        }
        return true;
    }

    function getVotes(uint projectId) external view returns (bool[] memory)  {
        return votes[projectId];
    }
}