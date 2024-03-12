// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Migrations {
    address public owner;
    uint public last_completed_migration;
    mapping(address => User) public users;

    struct User {
        string username;
        string password;
        string email;
        string accountNumber;
        string branchName;
        string nationality;
    }

    constructor() {
        owner = msg.sender;
    }

    modifier restricted() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function setCompleted(uint completed) public restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }

    function setUser(
        string memory _username,
        string memory _password,
        string memory _email,
        string memory _accountNumber,
        string memory _branchName,
        string memory _nationality
    ) public {
        users[msg.sender] = User(_username, _password, _email, _accountNumber, _branchName, _nationality);
    }

    function getUser() public view returns (
        string memory username,
        string memory password,
        string memory email,
        string memory accountNumber,
        string memory branchName,
        string memory nationality
    ) {
        User memory user = users[msg.sender];
        require(bytes(user.username).length > 0, "User does not exist"); // Check if user exists
        return (user.username, user.password, user.email, user.accountNumber, user.branchName, user.nationality);
    }

}