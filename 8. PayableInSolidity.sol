// SPDX-License-Identifier: MIT

/**
    Link to Original Source: 
        1. https://codedamn.com/news/solidity/payable-function-in-solidity-example-how-to-use-it#:~:text=What%20is%20Payable%20in%20Solidity,can%20send%20and%20receive%20Ether.
        2. https://solidity-by-example.org/payable/
        3. https://www.tutorialspoint.com/solidity/solidity_function_modifiers.htm

Payable
Functions and addresses declared payable can recive ether into the contract
When writing a smart contract, you need to ensure that money is being sent
to the contract and out of the contract as well
Payable does this for you, any function in Solidity with the modifier Payable
ensures that the function can send and receive Ether

It can process transactions with non-zero Ether values and rejects any transactions
with zero Ether value

Also, if you want a function to process transactions and have not included the payable
keyword in them the transaction will be automatically rejected

SYNTAX
    function receive() payable {}
    function send() payable {}
 */
 pragma solidity ^0.8.13;

 // EXAMPLE 1 CONTRACT 

 contract PayableInSolidity {
     // add the keyword payable to the state variable
    address payable public Owner;
    // set the owner to the msg.sender
    constructor () {
        // Make msg.sender payable
        Owner = payable(msg.sender);
    }
    // Create a modifier that the msg.sender must be the owner modifier
    modifier onlyOwner() {
        require(msg.sender == Owner, "Not owner");
        _;
    }
    // The owner can withdraw from the contract because payable was added
    // to the state variable above
    function withdraw(uint _amount) public onlyOwner {
        Owner.transfer(_amount);
    }
    // to.transfer works because we made the address above payable
    function transfer(address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
    }
 }

  // EXAMPLE 2 CONTRACT
  contract PayableExample {
      // Payable address can receive Ether
      address payable owner;
      
      // Payable constructor can receive Ether
      constructor() payable {
          owner = payable(msg.sender);
      }
      /**
        Function to deposit Ether into this contract
        Call this function along with some Ether
        The balance of this contract will be automatically updated
       */
       function deposit() public payable {}

       // Call this function along with some Ether.
       // The function will throw an error, since this function is not payable
       function notPayable() public {}

       // Function to withdraw all Ether from this contract.
       function withdraw() public {
           // get the amount of Erher stored in this contract
           uint amount = address(this).balance;

           // send all Ether to owner
           // Owner can receive Ether since the address of owner is payable
           (bool success, ) = owner.call{value: amount}("");
           require(success, "Failed to send Ether");
           /**
                For call, valid options are salt, gas and value
                salt - A salt is a bit of randomness added to a transaction (usually inputs to a hashing function) in order to make discovering a secret (key) harder.
                     - It is a value the sender sends while deploying the contract  
                gas - fee required to conduct a transaction on the Ethereum blockchain
           */
       }

       // Function to transfer Ether from this contract to address from input
       function transfer(address payable _to, uint _amount) public {
           // Note that "to" is declared as payable
           (bool success, ) = _to.call{value: _amount}("");
           require(success, "Failed to send Ether");
       }
  }
/**
    Fallback Payable
    Fallback paybale functions are also a big help in Solidity
    Imagine if someone sends funds to your contract in a function without the payable modifier,
    you can define such function to have a fallback payable function which enures that the transaction
    will go through regardless.

    This is why it is considered good practice to use some version of a function with *noname*
    and a payable modifier.
    Notice here the name of the function is "noname" and not payable, payable is the modifier
    Syntax
    
    function *noname* () payable {}
 */
