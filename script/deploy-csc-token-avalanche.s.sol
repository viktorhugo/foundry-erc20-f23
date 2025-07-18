// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.30;

import { Script } from "forge-std/Script.sol";
import { CSCToken } from "../src/CSCToken.sol";
import { console } from "forge-std/Script.sol";

contract DeployAvalancheCSCToken is Script { //* contract address   0x091ae374B8E0Ab30D9fF35F72260f5aE332C4485

    address private constant TREASURY = address(0x005d4ed37B60b6038FcEf02E2657f8861A0ceA81);

    function run() external returns (CSCToken) {
        console.log("TREASURY", TREASURY);
        vm.startBroadcast();
        CSCToken cscToken = new CSCToken(TREASURY);
        vm.stopBroadcast();
        return cscToken;
    }

}