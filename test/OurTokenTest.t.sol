// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.25;

import {Test} from "forge-std/Test.sol";
import { DeployOurToken } from "../script/DeployOurToken.s.sol";
import { OurToken } from "../src/OurToken.sol";

contract OurTokenTest is Test {

    uint256 public constant STARTING_BALANCE = 100 ether;
    
    OurToken public ourToken;
    DeployOurToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    

    function setUp() external {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        vm.prank(address(msg.sender)); // prank the deployer msg.sender
        ourToken.transfer(bob, STARTING_BALANCE);

        vm.prank(address(msg.sender)); // prank the deployer msg.sender
        ourToken.transfer(alice, STARTING_BALANCE);
    }

    function testTransferBob() public view {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(bob));
    }
}