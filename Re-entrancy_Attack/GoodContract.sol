//this is an bank where anyone can get deposit and get withdraw
pragma solidity >= 0.5.0 < 0.9.0;


contract EtherStore
{
    mapping(address=>uint)public balances;

    function deposit()external payable
    {
        require(msg.value>0,"Insufficient Funds");
        balances[msg.sender]=balances[msg.sender]+msg.value;
    }

    function withdraw()external payable
    {
        require(balances[msg.sender]>0,"You Havent deposited yet");
        (bool sent,)=msg.sender.call{value:balances[msg.sender]}("");
        require(sent,"Failed Transaction");
        //these aprt wont be rechead because trsaction went to recive  function other contract whic is recursively calling withdraw
        balances[msg.sender]=0;
    }



    //helper function to get Balance
     function getBalnce()public view returns(uint)
    {
        return address(this).balance;
    }
}