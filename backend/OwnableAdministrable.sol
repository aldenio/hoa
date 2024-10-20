// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";

/// @custom:security-contact aldenio@gmail.com
contract OwnableAdministrable is Ownable {

    address private _admin;
   /**
     * @dev The caller account is not authorized to perform an operation.
     */
    error AdministrableUnauthorizedAccount(address account);
    error InvalidAdministrator(address admin);
    event AdministrationTransferred(address indexed previousAdmin, address indexed newAdmin);

    constructor(address initialOwner) Ownable(initialOwner) {
        _admin = initialOwner;
    }

    modifier onlyAdministrator() {
        require(admin() == _msgSender(),  AdministrableUnauthorizedAccount(_msgSender()));
        _;
    }

    modifier onlyAdministratorOrOwner(){
        require(_msgSender() == admin() || _msgSender() == owner(), AdministrableUnauthorizedAccount(_msgSender()));
        _;
    }

    /**
     * @dev Returns the address of the current administrator of the contract.
     */
    function admin() public view virtual returns (address) {
        return _admin;
    }

    /**
     * @dev Transfers administration of the contract to a new account (`newAdmin`).
     * Can only be called by the current admin or current owner.
     */
    function transferAdministration(address newAdmin) public virtual onlyAdministratorOrOwner {
        if (newAdmin == address(0)) {
            revert InvalidAdministrator(address(0));
        }
        _transferAdministration(newAdmin);
    }

    /**
     * @dev Transfers administration of the contract to a new account (`newAdmin`).
     * Internal function without access restriction.
     */
    function _transferAdministration(address newAdmin) internal virtual {
        address oldAdmin = _admin;
        _admin = newAdmin;
        emit AdministrationTransferred(oldAdmin, newAdmin);
    }

    function _msgSender() internal view override returns (address) {
        return msg.sender;
    }

    function _msgData() internal pure override returns (bytes calldata) {
        return msg.data;
    }

    function _contextSuffixLength() internal pure override returns (uint256) {
        return 0;
    }
}

