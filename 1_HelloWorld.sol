// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

   // Our first start contract
contract HelloWorld{
    
    // State variable - stored on blockchain permanently 
    string messageGreet = "Hello World, Welcome to Solidity Practice Exercises";

    function getHello() public view returns (string memory){
        // Getter functions can be view or pure
        // In this case, the function reads the state variable, but does not modify it
        // Hence, use of "pure" keyword
        return messageGreet;
    }
    // To show the same with "view", we can have
    function sayHello() public pure returns(string memory){
        return "Hello Solidity community, we now start the Journey to Mastery";
        /* This function does not read state variables, nor does it modify them
           Rather than defining a variable to store the string, for readability,
           we can just return the string message

           The alternative for above would be as shown below:
        */
    }
    function helloPureString(string memory _helloMsg) public pure returns (string memory){
        _helloMsg = "Hello Solidity community, we now start the Journey to Mastery";
        return _helloMsg;
        // This function adds an extra line of code to the function
        // It is still pure, since it does not read or modify the state
    }
}
