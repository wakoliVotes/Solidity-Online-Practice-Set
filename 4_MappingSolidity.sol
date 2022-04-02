// SPDX-License-Identifier: MIT
/*
Link to Original Source:

1.  https://solidity-by-example.org/mapping/
2. https://hackernoon.com/how-to-create-a-mapping-in-solidity-u6p34k1
**/

pragma solidity ^0.8.13;

/**
Mapping

Maps are created with the syntax mapping(keyType => valueType).
mapping(_keyType => _valueType) public mappingName;

Nested Mapping
mapping(_keyType => mapping(_keyType => _valueType)) public mappingName

The keyType can be any built-in value types, bytes, string, or any contract
valueType can be any type including another mapping or any array

Mapping are not iterable.
 */

contract MappingSolidity {
    // Example 1: Mapping from address to uint    
    mapping (address => uint) public myMap;
    // The above shows a key-value relationship
    // for the myMap, mapping is 'address' and each corresponding value is an integer (uint)

    // Example 2: Mapping from uint to string
    mapping (uint => string ) public names;
    // For names, mapping is "uint" and each corresponding value is a string

    // Next, before deploying smart contract, we add some data using constructor function
    constructor() {
        names[101] = "Andrew Johnstone";
        names[102] = "Anthony Kingsman";
        names[103] = "Paul Peterson";
        names[105] = "Danielson Successful";
        names[106] = "Heather Wealthy";
    }
    // For the above, if you deploy the contract, you can access the names for the specific keys
    // 101 - Johnstone
    // Entering a key not in the names map gives empty

    function get(address _addr) public view returns (uint) {
        // Mapping always returns a value
        // If the value was never set, it will return the default value.
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        // Update the value at this address
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // Reset the value to the default value.
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)
    mapping (address => mapping (uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        return nested[_addr1][_i];
    }

    function set(
        address _addr1,
        uint _i,
        bool _boo
    ) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }

}
/**
Take Aways
Mapping does not have a length
Mapping is allowed for state variables
Mapping cannot return parameters of contract functions that are publicly visible
You cannot iterate through the mapping

 */
