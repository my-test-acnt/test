// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract Bank {
    mapping(address => uint) private balances;
    event Deposit(address indexed account, uint amount);
    event Withdrawal(address indexed account, uint amount);
    function deposit(uint amount) public {
        require(amount > 0, "Amount must be greater than zero.");
        balances[msg.sender] += amount;
        emit Deposit(msg.sender, amount);
    }
    function withdraw(uint amount) public {
        require(amount > 0, "Amount must be greater than zero.");
        require(balances[msg.sender] >= amount, "Insufficient balance.");
        balances[msg.sender] -= amount;
        emit Withdrawal(msg.sender, amount);
    }
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}

*********************************************************************************************************************
//code by ma'am 
pragma solidity ^0.6.0;

contract Bank
{
mapping(address=> uint ) private _balances;
address public owner;
event LogDepositeMade(address accountHoder, uint amount );

constructor () public
{
owner=msg.sender;
emit LogDepositeMade(msg.sender, 1000);
}

function deposite() public payable returns (uint)
{

require ((_balances[msg.sender] + msg.value) > _balances[msg.sender] && msg.sender!=address(0));
_balances[msg.sender] += msg.value;
emit LogDepositeMade(msg.sender , msg.value);
return _balances[msg.sender];
} 

function withdraw (uint withdrawAmount) public returns (uint)
{

require (_balances[msg.sender] >= withdrawAmount);
require(msg.sender!=address(0));
require (_balances[msg.sender] > 0);
_balances[msg.sender]-= withdrawAmount;
msg.sender.transfer(withdrawAmount);
emit LogDepositeMade(msg.sender , withdrawAmount);
return _balances[msg.sender];

}

function viewBalance() public view returns (uint)
{
return _balances[msg.sender];
}
}
