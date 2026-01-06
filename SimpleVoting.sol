// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleVoting {
    address public admin;

    // Voting status
    bool public votingOn;

    // Vote counts
    uint public candidate1Votes;
    uint public candidate2Votes;

    // Track if an address has already voted
    mapping(address => bool) public hasVoted;

    // Set deployer as admin
    constructor() {
        admin = msg.sender;
        votingOn = false; // voting is OFF by default
    }

    // Modifier to restrict admin-only actions
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    // Admin can turn voting ON or OFF
    function setVotingStatus(bool _status) external onlyAdmin {
        votingOn = _status;
    }

    // Vote for candidate 1 or 2
    function vote(uint _candidateId) external {
        require(votingOn, "Voting is currently OFF");
        require(!hasVoted[msg.sender], "You have already voted");
        require(_candidateId == 1 || _candidateId == 2, "Invalid candidate");

        hasVoted[msg.sender] = true;

        if (_candidateId == 1) {
            candidate1Votes++;
        } else {
            candidate2Votes++;
        }
    }

    // Get total votes for both candidates
    function getVotes() external view returns (uint, uint) {
        return (candidate1Votes, candidate2Votes);
    }
}
