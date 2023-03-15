// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity  >= 0.5.0 < 0.9.0;

contract Lottery
{
    //if any msg.sender calls the predict function at respective random time he wins
    function predict()public payable
    {
        if(block.timestamp%7==0)
        {
          (bool sent,)=msg.sender.call{value:10 ether}("");
          require(sent);
        }
    }
}

//Here since miner has higher chance of accesing block.timestamp
//they will call the predict function when block.timestamp%7==0 
//then they will win


//always avoid using block.timestamp

