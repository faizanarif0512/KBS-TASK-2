### Name- Muhammad Faizan Arif
### Roll No.- 25CE10077
### Email- muhammadfaizanarif@kgpian.iitkgp.ac.in
# TASK 2- KBS SELECTIONS

This ReadMe file contains the explanation of the Task 2, Simple Voting solidity code which i have commited in this repo.

# Simple Voting System (Solidity Smart Contract)

## Overview
This project implements a simple, fair, and transparent voting system using a Solidity smart contract. The contract allows users to vote for one of two candidates while ensuring that each wallet address can vote only once.

The contract also includes an administrative control to turn the voting process on or off.

## Ownership & Administration Logic
- The account that deploys the contract becomes the **administrator**.
- The administrator has exclusive permission to enable or disable voting.
- Administrative access is enforced using a Solidity modifier.

## Voting Rules
- Each wallet address (`msg.sender`) can vote **only once**.
- A vote can be cast **only when voting is turned ON**.
- Users can vote for:
  - Candidate 1
  - Candidate 2
- Any attempt to vote more than once or when voting is OFF will cause the transaction to fail.

## Functions

### `vote(uint candidateId)`
Allows a user to cast a vote.
- `candidateId = 1` → Candidate 1
- `candidateId = 2` → Candidate 2  
Fails if:
- Voting is OFF
- The caller has already voted
- An invalid candidate ID is provided

### `getVotes()`
Returns the total vote count for both candidates.
- Output: `(candidate1Votes, candidate2Votes)`

### `setVotingStatus(bool status)`
Allows the administrator to turn voting ON or OFF.
- `true` → Voting ON
- `false` → Voting OFF

## Security & Constraints
- Uses a `mapping(address => bool)` to track whether an address has already voted.
- Uses `require()` statements to enforce:
  - Single vote per address
  - Valid candidate selection
  - Voting status control
  - Admin-only access for status changes

## Deployment & Testing
- The contract was deployed and tested using **Remix IDE**.
- Environment used: **Remix VM (Prague)**.
- No real ETH is required for testing.

## Language & Tools
- **Language:** Solidity
- **Solidity Version:** ^0.8.20
- **IDE:** Remix Ethereum IDE

The code was compiled using REMIX IDE and deployed using REMIX VM using unique admin addresses.
