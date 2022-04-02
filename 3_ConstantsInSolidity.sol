// SPDX-License-Identifier: MIT

// Link to source: https://solidity-by-example.org/constants/

pragma solidity ^0.8.13;

/*
Constants are variables that cannot be modified
Their value is hard coded and using constants can save gas cost
Solidity supports the constant keyword for state variables and functions
The state variables that are defined as constant will have their values
assigned at compile time and will not allow any modifications at runtime

You cannot use blockchain data or blockchain information suc as now,
msg,value, block.number, or msg.sender to assign constant state variables.

However, you can use other built-in functions, like kecca256, ecrecover, & sha256

Ref Link: https://www.oreilly.com/library/view/mastering-blockchain-programming/9781839218262/7f1861df-c39b-4e76-b177-9ec0ddb10bfe.xhtml#:~:text=Solidity%20supports%20the%20constant%20keyword,information%20such%20as%20now%20%2C%20msg.

**/

contract ConstantsInSolidity {
    // coding convention to uppercase constant variables
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant MY_UINT = 12345;
    uint public constant totalSupply = 10 ** 9;
    string public constant symbol = "KINGSTKN";
    bytes32 public constant hash = keccak256("KINGSTKN");
}
