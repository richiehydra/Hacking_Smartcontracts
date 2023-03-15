const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("Private Data accessing", async function()
{
  it("Access Private variables a and b values",async()=>
  {
    const contract=await ethers.getContractFactory("Sample");
    const instance=await contract.deploy(1,2);
    await instance.deployed();

    console.log("The contract address is :" , instance.address);


    const value1=await ethers.provider.getStorageAt(instance.address,0);
    const value2=await ethers.provider.getStorageAt(instance.address,1);
    console.log(value1,value2);
  })
  


})

