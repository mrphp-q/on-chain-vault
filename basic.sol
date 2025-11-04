// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Vault is Ownable{
    mapping (address => uint256) public balances;
    uint256 public intRate = 5; //5%

    constructor() Ownable(msg.sender) {}

    function deposit() payable public {
        balances[msg.sender] = msg.value;
    }

    function withdraw(uint256 amount) external  {
        require(balances[msg.sender] >= amount, "Not enought funds");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function getBalance(address user) external view returns(uint256){
        return balances[user];
    }


}