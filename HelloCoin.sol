pragma solidity ^0.8.15;
// SPDX-License-Identifier: MIT

contract HelloCoin {

    string public name = 'HelloCoin';
    string public symbol = 'hc';

    // mapping(key type => value type) <access specifier> <name>
    mapping(address => uint) balances;

    // Declare an Event
    // event Deposit(address indexed _from, bytes32 indexed _id, uint _value);
    event Transfer(address _from, address _to, uint256 _value);

    constructor() public{
    // msg.sender stores the address of the sender 
        balances[msg.sender] = 1000;
    }

    function sendCoin(address _receiver, uint _amount) public returns(bool sufficient){

        if (balances[msg.sender] < _amount) return false;

        balances[msg.sender] -= _amount;
        balances[_receiver] += _amount;

        emit Transfer(msg.sender, _receiver, _amount);

        return true;
    }

    function getbalance(address _addr) public view returns(uint) {

        return balances[_addr];
    }

}