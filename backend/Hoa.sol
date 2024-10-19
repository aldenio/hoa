// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "./OwnableAdministrable.sol";

/// @custom:security-contact aldenio@gmail.com
contract  Hoa is OwnableAdministrable {

    
    constructor(address initialOwnerAndAdmin) OwnableAdministrable(initialOwnerAndAdmin) {
    }



}