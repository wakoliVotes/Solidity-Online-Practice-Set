// SPDX-License-Identifier: MIT

/**
View and Pure Functions
Getter functions can be declared view or pure.
Getter functions are used in retrieving the variable value

View functions declares that no state will be changed
Pure function declares that no state variable will be changed or read
*/
pragma solidity ^0.8.13;

contract ViewAndPureFunctions {
    // state variables - values permanently stored in contract storage
    uint public x = 1;
    // additions
    uint annualIncome = 2_500_000;
    uint annualBonus = 4_000_000;
    bool childrenNumb = true;
    bool hasWife = true;
    bool isMarried = childrenNumb && hasWife;
    // if has children and has wife, then married(true)
    
    // Vacation money per day for the organization is constant, hence:
    uint public constant vacMoney = 2_000;

    // Promise not to modify the state.
    // Example 1
    function addToX(uint y) public view returns (uint){
        return x + y;
        // reads, but there is no changing the state of variable x
    }
    // Example 2
    function CompareBonusToIncome() public view returns (bool){
        return annualBonus > annualIncome;
        // returns true, since bonus > income
    }
    // Example 3
    function maritalStatus() public view returns (bool){
        return isMarried;
    }
    
    // Promise not to modify or read from the state
    function add(uint i, uint j) public pure returns (uint){
        return i + j;
        // the function add() has only local variables,
        // It does not use state variables declared and initialized abive
    }
    // Function to get cost of vacation, given number of days of employee
    function getVacationCost(uint vacationDays) public pure returns (uint){
        /*
        Using uint makes the integers only non-negative
        Also, we can set condtions with require(condition)
        For example, for the organization, maximum vacation days is 90
        */
        require(vacationDays > 0 && vacationDays <= 90, "enter reasonable vacation days");
        // If one enters 0 or value greater than 90, it says:	The transaction has been reverted to the initial state. 
        // Reason provided by the contract: "enter reasonable vacation days".
        return vacationDays * vacMoney;
        // This function also only uses local variables, with no state variables

    }
}
