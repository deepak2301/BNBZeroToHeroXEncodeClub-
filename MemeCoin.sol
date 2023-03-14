// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract DogCoin{
    uint256 totalSupply = 2000000;
    address owner = msg.sender;

    mapping(address => uint256) balances;
    // declare balances mapping to track user balances
    mapping (address => Payment[]) public payments;

    event newSupply(uint256);
    event Transfer(address indexed _recipient, uint256 _amount);


    //struct 
    struct Payment{
        address recipient;
        uint256 amount;

    }

    modifier onlyOwner{
         require(msg.sender == owner);
      _;
    }

    constructor(){
        owner = msg.sender;
        balances[msg.sender] = totalSupply; //owners balance 
    }

    function getBalance(address _user) public view returns(uint256){
        return balances[_user];
    }

    function getTotalSupply() public view returns(uint256){
        return totalSupply;
    }

    function increaseSupply() public onlyOwner {
        totalSupply +=1000;
        emit newSupply(totalSupply);
    }

    function transfer(address _recipient, uint256 _amount) public {
        require(balances[msg.sender]>= _amount,"Not Enough Balance");
        require(_recipient != address(0),"Invalid recepient address");

        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;

        payments[msg.sender].push(Payment(_recipient, _amount));

        emit Transfer( _recipient, _amount);
    }

}
