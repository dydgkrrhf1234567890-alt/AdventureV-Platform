// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// AdventureV Empire Official Token Contract
// Authority: Prince Solomon
// Code Name: Genesis Gold

contract AdventureV_Token {
    string public name = "AdventureV Gold";   // 코인 이름
    string public symbol = "ADVC";            // 코인 심볼
    uint8 public decimals = 18;               // 소수점 단위
    uint256 public totalSupply;               // 총 발행량
    
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 initialSupply) {
        // 창조주(왕자님)에게 모든 코인을 지급
        totalSupply = initialSupply * (10 ** uint256(decimals));
        balanceOf[msg.sender] = totalSupply;
    }

    // 코인 전송 기능 (지갑으로 쏘는 기능)
    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value, "잔액이 부족합니다 (Not enough Gold)");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
}
