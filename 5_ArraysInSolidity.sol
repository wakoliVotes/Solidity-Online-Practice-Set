// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract ArraysInSolidity {
    uint[] integerArray;        // sample showing initialization of an array of integers
    bool[] boolArray;            // sample showing initialization of an array of booleans
    address[] addressArray;      // sample showing initialization of an array of address etc


    // Example 1;
    // fixed array
    uint[5] data = [9, 2,8, 4, 6];
    // dyanamic array
    uint[] newData = [9, 2, 8, 4, 6, 1, 10];

    function showFixedArray() public view returns (uint[5] memory){
        return data;
        // Gives 0: uint256[]: 9,2,8,4,6
    }
    // for above, return type must match, hence if 6 or 10 is entered, it will throw a data type mismatch error
    // the initialized array size was 5
    
    function showDyanamicArray() public view returns (uint[] memory){
        return newData;
        // Gives 0: uint256[]: 9,2,8,4,6,1,10
    }
    
    // Example 2
    uint[] employeeAges;        // ages array    

    function menipulateArrays() public {
        employeeAges.push(24);      // add an element to the array
        employeeAges.push(34);      // add another element to the array
        employeeAges.push(36);      // add another element to array
        employeeAges.push(30);      // add another element to the array

        employeeAges[0];            // get the element at key 0 [first element] in array
        employeeAges[0] = 28;       // update first element in the array
    }
    // we can show the list of employees in the array as below
    function showEmployeeList() public view returns (uint[] memory){
        return employeeAges;
        // Gives 0: uint256[]: 28,34,36,30
    }
}
