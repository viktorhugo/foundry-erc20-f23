// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.30;

import { Script } from "forge-std/Script.sol";
import { CSCToken } from "../src/CSCToken.sol";
import { console } from "forge-std/Script.sol";

contract DeployETHCSCToken is Script {

    address private constant TREASURY = address(0x6A8221C259Ee20813a0f052537166B106f450b3a);

    function run() external returns (CSCToken) {
        console.log("TREASURY", TREASURY);
        vm.startBroadcast();
        CSCToken cscToken = new CSCToken(TREASURY);
        vm.stopBroadcast();
        return cscToken;
    }

}