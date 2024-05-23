// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.25;

import { ERC20 } from "@OpenZeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    
    constructor(uint256 initialSupply) ERC20("CapyToken", "CAPY") {
        _mint(msg.sender, initialSupply);
    }    
}