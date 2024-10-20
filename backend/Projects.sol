// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import {Board} from "./Board.sol";

/// @custom:security-contact aldenio@gmail.com
contract Projects is Board { 

    enum Status {APPROVED, DECLINED, ACTIVE}

    struct Project {
        uint id;
        string name;
        string description;
        uint budget;
        Status status;
    }
    
    Project[] projects;

    event ProjectCreated(Project indexed project);
    event ProjectApproved(uint indexed projectId);
    event ProjectDeclined(uint indexed projectId);
    error InvalidProjectId(uint);
    error CannotDeclineApprovedProject(uint  projectId);
    error CannotApproveDeclinedProject(uint  projectId);
    error InvalidProjectStatus(uint, Status);

    constructor(address initialOwnerAndAdmin) Board(initialOwnerAndAdmin) {
    }

    modifier onlyValidId(uint projectId){
        if (projectId >= projects.length) {
            revert InvalidProjectId(projectId);
        }
        _;
    }
    
    function getProjectBudget(uint projectId) public view onlyValidId(projectId) returns (uint) {
        return projects[projectId].budget;
    }

    function getProjectName(uint projectId) public view onlyValidId(projectId) returns (string memory)  {
        return projects[projectId].name;
    }
    function getProjectDescription(uint projectId) public view onlyValidId(projectId) returns (string memory)   {
        return projects[projectId].description;
     }

    function getProjectCount() public view returns (uint) {
        return projects.length;
    }

    function getProjectStatus(uint projectId) public view onlyValidId(projectId) returns (Status)    {
        return projects[projectId].status;
    }

    function isProjectActive(uint projectId) public view onlyValidId(projectId) returns (bool)   {
        return projects[projectId].status == Status.ACTIVE;
    }

    function _declineProject(uint projectId) internal onlyValidId(projectId) {
        if (projects[projectId].status == Status.APPROVED) {
            revert CannotDeclineApprovedProject(projectId);
        }
        projects[projectId].status = Status.DECLINED;
        emit ProjectDeclined(projectId);
     }
    
    function _approveProject(uint projectId) internal onlyValidId(projectId) {
        if (projects[projectId].status == Status.DECLINED){
            revert CannotApproveDeclinedProject(projectId);
        }
        projects[projectId].status = Status.APPROVED;
        emit ProjectApproved(projectId);
    }

    function _addProject(string calldata _name, string calldata _description, uint _budget) internal returns (uint) {
        Project memory newProject = Project(
            {id : projects.length, 
            name : _name, 
            description : _description, 
            budget : _budget,
            status: Status.ACTIVE}
        );
        projects.push(newProject);

        emit ProjectCreated(newProject);
        return projects.length - 1;
    }


}