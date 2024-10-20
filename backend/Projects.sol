// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import {Board} from "./Board.sol";

/// @custom:security-contact aldenio@gmail.com
contract Projects is Board { 

    enum Status {APPROVED, DECLINED, REJECTED, ACTIVE}

    struct Project {
        uint id;
        string name;
        string description;
        uint budget;
        Status status;
    }
    
    Project[] public projects;

    event ProjectCreated(Project indexed project);
    event ProjectApproved(uint indexed projectId);
    event ProjectDeclined(uint indexed projectId);
    event ProjectRejected(uint indexed projectId);
    error InvalidProjectId(uint);
    error InvalidProjectStatus(uint);

    constructor(address initialOwnerAndAdmin) Board(initialOwnerAndAdmin) {
    }

    modifier onlyValidId(uint projectId){
        if (projectId >= projects.length) {
            revert InvalidProjectId(projectId);
        }
        _;
    }

    function isProjectActive(uint projectId) public view onlyValidId(projectId) returns (bool)   {
        return projects[projectId].status == Status.ACTIVE;
    }

    function isProjectApproved(uint projectId) public view onlyValidId(projectId) returns (bool)   {
        return projects[projectId].status == Status.APPROVED;
    }

    function _declineProject(uint projectId) internal onlyValidId(projectId) {
        require(isProjectActive(projectId), "Only Active projects may be declined.");
        projects[projectId].status = Status.DECLINED;
        emit ProjectDeclined(projectId);
     }

    
    function _approveProject(uint projectId) internal onlyValidId(projectId) {
        require(isProjectActive(projectId), "Only Active projects may be approved.");
        projects[projectId].status = Status.APPROVED;
        emit ProjectApproved(projectId);
    }

    function _rejectProject(uint projectId) internal onlyValidId(projectId) {
        require(isProjectActive(projectId), "Only Active projects may be rejected.");
        projects[projectId].status = Status.REJECTED;
        emit ProjectRejected(projectId);
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

    function getProjectBudget(uint projectId) public view onlyValidId(projectId) returns (uint) {
        return projects[projectId].budget;
    }

    function getProjectName(uint projectId) public view onlyValidId(projectId) returns (string memory)  {
        return projects[projectId].name;
    }
    function getProjectDescription(uint projectId) public view onlyValidId(projectId) returns (string memory)   {
        return projects[projectId].description;
    }

    function getProjectStatus(uint projectId) external view onlyValidId(projectId) returns (Status)    {
        return projects[projectId].status;
    }
}