// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.30;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { console } from "forge-std/Script.sol";

/** Errors */
error CSCToken__MaxSupply();
error CSCToken__TreasuryError();


contract CSCToken is ERC20, Ownable {

    /** Type declarations */
    address private s_treasury;
    uint256 public constant INITIAL_SUPPLY = 65000000000 * 10**18;
    
    /** State Variables */

    /** Events */
    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);
    event TransferWithMemo(address indexed from, address indexed to, uint256 value, string memo);

    constructor(address treasury) ERC20("CasinoCoinTest", "CSCTEST") Ownable(msg.sender) {
        console.log("constructor", treasury);
        console.log("address(0)", address(0));
        if (treasury == address(0)) revert CSCToken__TreasuryError();
        s_treasury = treasury;
        _mint(treasury, INITIAL_SUPPLY);
    }

    function mint(address to, uint256 amount) external onlyOwner {
        if (totalSupply() + amount <= INITIAL_SUPPLY) revert CSCToken__MaxSupply();
        _mint(to, amount);
        emit Mint(to, amount);
    }

    function burn(address from, uint256 amount) external onlyOwner {
        _burn(from, amount);
        emit Burn(from, amount);
    }

    function setTreasury(address newTreasury) external onlyOwner {
        require(newTreasury != address(0), "Invalid treasury address");
        s_treasury = newTreasury;
    }

    function getTreasury() external view returns (address) {
        return s_treasury;
    }

    function transferWithMemo(address recipient, uint256 amount, string memory memo) public returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        emit TransferWithMemo(_msgSender(), recipient, amount, memo);
        return true;
    }
}