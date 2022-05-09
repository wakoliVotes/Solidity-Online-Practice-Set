// SPDX-License-Identifier: MIT

/**Link to original source: 
                1. https://www.tutorialspoint.com/solidity/solidity_constructors.htm#:~:text=Constructor%20is%20a%20special%20function,can%20have%20only%20one%20constructor.
                2. https://solidity-by-example.org/constructor/

Constructor

A constructor is an optional function that is executed upon contract creation
It is a special function, declared using the 'constructor' keyword

Here are examples of how to pass arguments to constructors.
*/

pragma solidity ^0.8.7;

// Base contract X
contract X {
    string public name;

    constructor(string memory _name){
        name = _name;
    }
}
// Base contract Y
contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// There are 2 ways to initialize parent contract with parameters.

// Pass the parameters here in the inheritance list
contract B is X("Input to X"), Y ("Input to Y") {

}

contract C is X, Y {
    // Pass the oarameters here in the constructor,
    // similar to function modifiers
    constructor(string memory _name, string memory _text) X(_name) Y(_text){

    }
}

// Parenet constructor are always called in the order of inheritance
// regardless of the order of parent contracts listed in the 
// constructor of the child contract

// Order of constructor called
// 1. X
// 2. Y
// 3. D

contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {

    }
}
// Order of constructor called:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called"){

    }
}
/**
    On deployment on Remix, the contract list will include all the contracts created
    To deploy, select the contract
    For example, contract Y will require you to enter string _text
    And contract C string _name, string _text


    EXTRA Information
    
    Characteristics of Constructors
        1. A contract can have only one constructor
        2. A constructor code is executed once when a contract is created
            and it is used to initialize contract state
        3. After a constructor code is executed, the final code is deployed to blockchain
            This code include public functions and code reachable through public functions
            Constructor code or any internal method used only by the constructor are not
            included in the code
        4. A constructor can either be public or internal
        5. An internal constructor marks the contract as abstract
        6. In case, no constructor is defined, a default constructor is present in the contract
        7. In case, base contract have constructor with arguments, each derived contract have to pass them
        8. Base constructor can be initialized directly using following way
 */
 // This next illustration just iterates the examples above

 contract Base {
     uint data;
     constructor(uint _data) {
         data = _data;
     }
 }
 // Inheritance of Base
 contract Derived is Base(5){
     constructor(){
    }
 }
