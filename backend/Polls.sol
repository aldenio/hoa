
// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import {Projects} from "./Projects.sol";

contract Polls is Projects {

    mapping (uint => bool[]) votes;
    mapping (uint => address[]) whoVoted;

    error AlreadyVotedForThisProject(address, uint);

    constructor(address initialOwnerAndAdmin)  Projects(initialOwnerAndAdmin) {
    }

    function startPoll(string calldata _name, string calldata _description, uint _budget) external onlyAdministrator {
        uint projectId = _addProject(_name, _description, _budget);
        whoVoted[projectId] = new address[](getBoardSize());
        votes[projectId] = new bool[](getBoardSize());
    }

    function cancelPoll(uint projectId) external onlyAdministrator {
        _declineProject(projectId);
    }
    
    function submitVote(uint projectId, bool vote) external onlyBoardMembers  {  // submit vote for the project 
        if (!isProjectActive(projectId)) {
            revert InvalidProjectStatus(projectId, getProjectStatus(projectId));
        }
        if (hasMemberAlreadyVoted(projectId, msg.sender)) {
            revert AlreadyVotedForThisProject(msg.sender, projectId);
        }
        votes[projectId].push(vote);  
        whoVoted[projectId].push(msg.sender);
        if (_wasProjectUnanimousVotedYes(projectId)){
            _approveProject(projectId);
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

    function _wasProjectUnanimousVotedYes(uint projectId) internal view returns (bool)  {
        if (votes[projectId].length < getBoardSize()) return false;
        for (uint i=0; i<votes[projectId].length; i++) {
            if (votes[projectId][i] == false) {
                return false;
            }
        }
        return true;
    }
}