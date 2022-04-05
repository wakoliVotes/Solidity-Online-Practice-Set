// SPDX-License-Identifier: MIT

/**
Link to Original Source: 
        1. https://solidity-by-example.org/function/
        2. https://www.tutorialspoint.com/solidity/solidity_functions.htm
        3. https://www.nielit.gov.in/sites/default/files/Aurangabad/Blockchain-Module4.pdf

Function
A function is a group of reusable code which can be called anywhere in the smar contract
Before using a function, one needs to define it using the "function" keyword
This is followed by a unique function name, list of parameters (that might be empty)
and a statement block surrounded by curly braces
SYNTAX:
    
    function functionName(parameter_list) scope returns () {
        // statements - do something(s)
    }

There are several ways to return outputs from a function
Public functions cannot accept certain data types as inputs or outputs

NOTE:
Functions can be defined inside and outside of contracts
Code of functions outside of a contract, also called "free functions"
is included in all contracts that call them, similar to internal library functions
*/

pragma solidity ^0.8.13;

// Free functions can be set here, outside the smart contract

contract FunctionsInSolidity {
    // Functions can return multiple values
    function returnMany()
        public
        pure
        returns (
            uint256,
            bool,
            uint256
        )
    {
        return (1, true, 2);
    }

    // Return values can be named
    function named()
        public
        pure
        returns (
            uint256 x,
            bool b,
            uint256 y
        )
    {
        return (1, true, 2);
    }

    // Return values can be assigned to their name.
    // In this case the return statement can be ommitted.

    function assigned()
        public
        pure
        returns (
            uint256 x,
            bool b,
            uint256 y
        )
    {
        x = 1;
        b = true;
        y = 2;
    }

    /** 
        Calling a Function
        To invoke a function somewhere later in the smart contract,
        you can simply write the name of that function

        Use destructuring assignment when calling another
        function that returns multiple values
    */

    function destructuringAssignments()
        public
        pure
        returns (
            uint256,
            bool,
            uint256,
            uint256,
            uint256
        )
    {
        (uint256 i, bool b, uint256 j) = returnMany();

        // values can be left out.
        (uint256 x, , uint256 y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // Cannot use map for either input or output

    // Can use array for input
    function arrayInput(uint256[] memory _arr) public {}

    // Can use array for output
    uint256[] public arr;

    function arrayOutput() public view returns (uint256[] memory) {
        return arr;
    }
}
