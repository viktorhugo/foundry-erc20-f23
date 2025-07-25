// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.30;

contract ManualToken {

    mapping (address => uint256) private s_balances;

    constructor() {}

    function name() public  pure returns (string memory) {
        return "ManualToken";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function decimals () public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public  {
        uint256 previousBalance = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        require( previousBalance == balanceOf(msg.sender) + balanceOf(_to) );
    }
}