pragma solidity >= 0.5.0 < 0.9.0;

contract A
{
   //helper function to verify whethher forcefully got ethers or not
   function getBalance()public view returns(uint)
   {
    return address(this).balance;
   }


}


contract B
{
    function attack(address payable destination)payable public 
    {
        //send forcefully msg.value to contract A
        selfdestruct(destination);
    }
}