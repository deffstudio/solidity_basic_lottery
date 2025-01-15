// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Lottery.sol";

contract LotteryTest is Test {
    Lottery lottery;
    address manager = address(0x123);
    address participant1 = address(0x456);
    address participant2 = address(0x789);

    function setUp() public {
        vm.prank(manager);
        lottery = new Lottery(10); // 10-minute lottery
    }

    function testParticipation() public {
        vm.deal(participant1, 1 ether);
        vm.prank(participant1);
        lottery.participate{value: 0.01 ether}();
        assertEq(lottery.getParticipants().length, 1);
    }

    function testSelectWinner() public {
        vm.deal(participant1, 1 ether);
        vm.deal(participant2, 1 ether);

        vm.prank(participant1);
        lottery.participate{value: 0.01 ether}();

        vm.prank(participant2);
        lottery.participate{value: 0.01 ether}();

        vm.warp(block.timestamp + 11 minutes); // Fast-forward time
        vm.prank(manager);
        lottery.selectWinner();

        assertEq(lottery.getParticipants().length, 0);
    }

    function testSelectWinnerWithNoParticipatns() public {
        vm.warp(block.timestamp + 11 minutes); // Fast-forward time
        vm.prank(manager);
        vm.expectRevert("No participants in the lottery");
        lottery.selectWinner();
    }
}