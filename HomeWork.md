# BNBZeroToHeroXEncodeClub

**Problem 1**

To this contract
1. Add a variable to hold the address of the deployer of the contract
2. Update that variable with the deployer's address when the contract is
deployed.
. Write an external function to return
1. Address 0x000000000000000000000000000000000000dEaD if called by
the deployer
2. The deployer's address otherwise



**Solution**

```javascript


// SPDX-License-Identifier: None

pragma solidity 0.8.17;


contract BootcampContract {

    uint256 number;
    address owner;

    constructor(){
        owner = msg.sender;
    }


    function store(uint256 num) public {
        number = num;
    }

    function retrieve() public view returns (uint256){
        return number;
    }
    
    function deployerAdd() external view returns (address){
        require(msg.sender==owner);
        return owner;
    }
}
```
