// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {OwnableAdministrable} from "./OwnableAdministrable.sol";


contract Board is OwnableAdministrable {

    address[] public _board;

    error InvalidAddress(address);
    error AddressNotInBoard(address);

    event MemberAddedToBoard(address indexed member);
    event MemberRemovedFromBoard(address indexed member);
    

    constructor(address initialOwnerAndAdmin)  OwnableAdministrable(initialOwnerAndAdmin) 
    {
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
                return;
            }   
        }
        revert AddressNotInBoard(member);
    }

}
