// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Lottery} from "../src/Lottery.sol";

contract DeployLottery is Script {
    function run() external {
        vm.startBroadcast();

        Lottery lottery = new Lottery(10); // 10-minute lottery

        vm.stopBroadcast();
    }
}