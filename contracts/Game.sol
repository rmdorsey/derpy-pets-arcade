// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//TODO:
//LOOK FOR WALLETS OTHER THAN METAMASK
//INCLUDE MOBILE WALLETS AND HARDWARE WALLETS
//LOOK INTO WALLET CONNECT
//USE CHAINLINK VRF TO HANDLE RANDOMNESS

contract Game {
    uint256 public balance;

    constructor() {}

    function receiveMoney() public payable {
        balance += msg.value;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function play(bool won) public payable {
        if (won == true) {
            address payable to = payable(msg.sender);
            to.transfer(getBalance());
        } else {
            receiveMoney();
        }
    }
}
