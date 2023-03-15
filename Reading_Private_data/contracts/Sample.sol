// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Sample {
  //slot 0
    uint256 private a;
  //slot 1
    uint256 private b;
    constructor(uint256 value1,uint value2)
    {
        a=value1;
        b=value2;
    }
    
}
