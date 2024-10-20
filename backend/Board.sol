// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {OwnableAdministrable} from "./OwnableAdministrable.sol";


contract Board is OwnableAdministrable {

    address[] public _board;

    error InvalidAddress(address);
    error NotABoardMember(address);

    event BoardMemberAdded(address indexed member);
    event BoardMemberRemoved(address indexed member);
    event BoardMemberChanged(address indexed member, address newMember);

    constructor(address initialOwnerAndAdmin)  OwnableAdministrable(initialOwnerAndAdmin) 
    {
    }

    modifier onlyBoardMembers() {
        if (!isBoardMember(msg.sender)) {
            revert NotABoardMember(msg.sender);
        }
        _;
    }

    function getBoardSize() public view returns(uint) {
        return _board.length;
    }

    function isBoardMember(address member) public view returns (bool) {
        for(uint i = 1 ; i < _board.length ; i++){
            if(_board[i] == member){
                return true;
            }   
        }
        return false;
    } 

    function getBoard() public view returns (address[] memory) {
        return _board;
    }

    function addToBoard(address member) public onlyAdministratorOrOwner {
        if (member == address(0)) {
            revert InvalidAddress(member);
        }

        for(uint i = 0 ; i < _board.length ; i++){
            if(_board[i] == address(0)){
                _board[i] = member;
                emit BoardMemberAdded(member);
                return;
            }   
        }
        _board.push(member);
    }

    function removeFromBoard(address member) public onlyAdministratorOrOwner {
        if (member == address(0)) {
            revert InvalidAddress(member);
        }
        for(uint i = 0 ; i < _board.length ; i++){
            if(_board[i] == member){
                delete _board[i];
                emit BoardMemberRemoved(member);
                return;
            }   
        }
        revert NotABoardMember(member);
    }
    
    function changeBoardMember(address member, address newMember) public onlyAdministratorOrOwner {
        if (member == address(0)) {
            revert InvalidAddress(member);
         } 
        if (newMember == address(0)) {
            revert InvalidAddress(newMember);
        } 
        for(uint i = _board.length - 1 ; i >= 0 ; i--){
            if(_board[i] == member){
                _board[i] = newMember;
                emit BoardMemberChanged(member, newMember);
                return;
            }   
        }
        revert NotABoardMember(member); 
    }


}
