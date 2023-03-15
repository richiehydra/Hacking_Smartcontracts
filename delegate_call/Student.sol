pragma solidity >= 0.5.0 < 0.9.0;

contract Attacker
{
    uint public sum;
    function callAddTwoNumbers(address host,uint a ,uint b)public returns(uint)
    {
        (bool status,bytes memory result)=host.delegatecall(abi.encodeWithSignature("addTwoNumbers(uint256,uint256)",a,b));
        require(status);
        return abi.decode(result,(uint));
    }
}
