// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {SentinelV1} from "../src/SentinelV1.sol";

contract DeploySentinelLocal is Script {
    function run() external {
        vm.startBroadcast();
        SentinelV1 sentinel = new SentinelV1(address(0)); // placeholder for Engine 2 ML oracle
        vm.stopBroadcast();
        console.log("SentinelV1 deployed locally at:", address(sentinel));
    }
}
