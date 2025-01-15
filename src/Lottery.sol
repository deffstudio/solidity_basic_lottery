// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public manager;
    address[] public participants;
    uint public endTime;
    uint public constant PARTICIPATION_FEE = 0.01 ether;

    constructor(uint durationInMinutes) {
        manager = msg.sender;
        endTime = block.timestamp + (durationInMinutes * 1 minutes);
    }

    function participate() external payable {
        require(block.timestamp < endTime, "Lottery has ended");
        require(msg.value == PARTICIPATION_FEE, "Incorrect participation fee");
        participants.push(msg.sender);
    }

    function selectWinner() external {
        require(block.timestamp >= endTime, "Lottery is still ongoing");
        require(msg.sender == manager, "Only manager can select winner");
        require(participants.length > 0, "No participants in the lottery");

        uint winnerIndex = uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, participants.length))) % participants.length;
        address winner = participants[winnerIndex];

        (bool success, ) = winner.call{value: address(this).balance}("");
        require(success, "Transfer failed");

        // Reset the lottery
        participants = new address[](0);
        endTime = block.timestamp + 10 minutes; // Restart lottery for demo purposes
    }

    function getParticipants() external view returns (address[] memory) {
        return participants;
    }
}