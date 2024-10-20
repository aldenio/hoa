// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {OwnableAdministrable} from "./OwnableAdministrable.sol";


contract Board is OwnableAdministrable {

    address[] public _board;
    uint _boardSize;

    error InvalidAddress(address);
    error NotABoardMember(address);
    error AlreadyBoardMember(address);

    event BoardMemberAdded(address indexed member);
    event BoardMemberRemoved(address indexed member);
    event BoardMemberChanged(address indexed member, address newMember);

    constructor(address initialOwnerAndAdmin)  OwnableAdministrable(initialOwnerAndAdmin) 
    {
    }

    modifier onlyBoardMembers() {
        require(isBoardMember(_msgSender()), NotABoardMember(msg.sender));
        _;
    }

    modifier onlyNonBoardMembers(address member) {
        require(isBoardMember(member) == false, AlreadyBoardMember(member));
        _;
    }

    modifier onlyValidAddress(address arg) {
        require(arg != address(0), InvalidAddress(arg));
        _;
    }

    function addToBoard(address member) public 
        onlyValidAddress(member) 
        onlyNonBoardMembers(member)
        onlyAdministratorOrOwner 
    {
        for(uint i = 0 ; i < _board.length ; i++){
            if(_board[i] == address(0)){
                _board[i] = member;
                _boardSize++;
                emit BoardMemberAdded(member);
                return;
            }   
        }
        _board.push(member);
        _boardSize++;
    }

    function removeFromBoard(address member) public 
        onlyValidAddress(member)  
        onlyAdministratorOrOwner 
    {
        for(uint i = 0 ; i < _board.length ; i++){
            if(_board[i] == member){
                delete _board[i];
                _boardSize--;
                emit BoardMemberRemoved(member);
                return;
            }   
        }
        revert NotABoardMember(member);
    }
    
    function changeBoardMember(address member, address newMember) public 
        onlyValidAddress(member) 
        onlyValidAddress(newMember)  
        onlyAdministratorOrOwner 
    {
        for(uint i = 0; i < _board.length; i++){
            if (_board[i] == member) {
                _board[i] = newMember;
                emit BoardMemberChanged(member, newMember);
                return;
            }   
        }
        revert NotABoardMember(member); 
    }

    function getBoard() public view returns (address[] memory) {
        return _board;
    }

    function getBoardSize() public view returns(uint) {
        return _boardSize;
    }

    function isBoardMember(address member) public view 
        onlyValidAddress(member) 
        returns (bool) 
    {
        for(uint i = 0 ; i < _board.length ; i++){
            if(_board[i] == member){
                return true;
            }   
        }
        return false;
    } 
}
