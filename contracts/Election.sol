pragma solidity ^0.5.16;

contract Election {
  // Model a candidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  // Store voters
  mapping(address => bool) public voters;
  // Store candidates
  // Fetch candidates
  mapping(uint => Candidate) public candidates;
  // Store candidate counts
  uint public candidatesCount;

  constructor() public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  function addCandidate (string memory _name) private {
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  function vote (uint _candidateId) public {
    require(!voters[msg.sender], 'Already Voted');
    require(_candidateId > 0 && _candidateId <= candidatesCount, 'Invalid Candidate');
    // record vote for voter
    voters[msg.sender] = true;

    // update candidate vote count
    candidates[_candidateId].voteCount ++;
  }
}
