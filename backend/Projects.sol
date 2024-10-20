// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import {Board} from "./Board.sol";

/// @custom:security-contact aldenio@gmail.com
contract Projects is Board { 

    enum Status {REJECTED, ACTIVE, DECLINED, APPROVED, FUNDED}

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
    event ProjectFunded(uint indexed projectId);
    error InvalidProjectId(uint);
    error InvalidProjectStatus(uint);

    constructor(address initialOwnerAndAdmin) Board(initialOwnerAndAdmin) {
    }

    modifier onlyValidProjectId(uint projectId){
        require(projectId < projects.length, InvalidProjectId(projectId));
        _;
    }

    function _declineProject(uint projectId) internal onlyValidProjectId(projectId) {
        require(isProjectActive(projectId), "Only Active projects may be declined.");
        projects[projectId].status = Status.DECLINED;
        emit ProjectDeclined(projectId);
     }

    function _approveProject(uint projectId) internal onlyValidProjectId(projectId) {
        require(isProjectActive(projectId), "Only Active projects may be approved.");
        projects[projectId].status = Status.APPROVED;
        emit ProjectApproved(projectId);
    }

    function _rejectProject(uint projectId) internal onlyValidProjectId(projectId) {
        require(isProjectActive(projectId), "Only Active projects may be rejected.");
        projects[projectId].status = Status.REJECTED;
        emit ProjectRejected(projectId);
    }

    function _markProjectAsFunded(uint projectId) internal onlyValidProjectId(projectId) {
        require(isProjectApproved(projectId), "Only Approved projects may be funded.");
        projects[projectId].status = Status.FUNDED;
        emit ProjectFunded(projectId);
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

    function getProjectBudget(uint projectId) public view onlyValidProjectId(projectId) returns (uint) {
        return projects[projectId].budget;
    }

    function getProjectName(uint projectId) public view onlyValidProjectId(projectId) returns (string memory)  {
        return projects[projectId].name;
    }
    function getProjectDescription(uint projectId) public view onlyValidProjectId(projectId) returns (string memory)   {
        return projects[projectId].description;
    }

    function getProjectStatus(uint projectId) external view onlyValidProjectId(projectId) returns (Status)    {
        return projects[projectId].status;
    }
    
    function isProjectActive(uint projectId) public view onlyValidProjectId(projectId) returns (bool)   {
        return projects[projectId].status == Status.ACTIVE;
    }

    function isProjectApproved(uint projectId) public view onlyValidProjectId(projectId) returns (bool)   {
        return projects[projectId].status == Status.APPROVED;
    }

    function isProjectFunded(uint projectId) public view onlyValidProjectId(projectId) returns (bool)   {
        return projects[projectId].status == Status.FUNDED;
    }
}