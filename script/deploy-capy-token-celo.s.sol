// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.30;

import { Script } from "forge-std/Script.sol";
import { CAPYToken } from "../src/CAPYToken.sol";
import { console } from "forge-std/Script.sol";

contract DeployCAPYToken is Script {

    address private constant TREASURY = address(0xd56279982a6363aD04d8DF8965F4702554AD0553);

    function run() external returns (CAPYToken) {
        console.log("TREASURY", TREASURY);
        vm.startBroadcast();
        CAPYToken cscToken = new CAPYToken(TREASURY);
        vm.stopBroadcast();
        return cscToken;
    }

}