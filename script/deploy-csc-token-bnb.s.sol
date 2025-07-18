// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.30;

import { Script } from "forge-std/Script.sol";
import { CSCToken } from "../src/CSCToken.sol";
import { console } from "forge-std/Script.sol";

contract DeployBNBCSCToken is Script { //* contract address 0xE65BD9a2248Aa2fe5a2eAD247275eFb77E6394b6

    address private constant TREASURY = address(0x9f1ee712D03C2c6d9CD98787c5dB45cE7AcB01C6);

    function run() external returns (CSCToken) {
        console.log("TREASURY", TREASURY);
        vm.startBroadcast();
        CSCToken cscToken = new CSCToken(TREASURY);
        vm.stopBroadcast();
        return cscToken;
    }

}