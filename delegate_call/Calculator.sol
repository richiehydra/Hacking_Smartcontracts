pragma solidity >= 0.5.0 < 0.9.0;

contract Calculator 
{
    uint public result;
    address public user;
    function addTwoNumbers(uint a,uint b)public  returns(uint)
    {
         result=a+b;
        user=msg.sender;
        return result;
    }
}