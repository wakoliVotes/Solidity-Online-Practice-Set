// SPDX-License-Identifier: MIT

/** Link to original source: 

1. https://jeancvllr.medium.com/solidity-tutorial-all-about-structs-b3e7ca398b1e#:~:text=Structs%20are%20a%20way%20to,types)%20under%20a%20single%20name.
2. https://solidity-by-example.org/structs/


Structs

Structs are a way to define new custom types in Solidity.
The Solidity documentation define them as “objects with no functionalities”, however, they are more than that.
Like in C, structs in Solidity are a collection of variables (that can be of different types) under a single name.

You can define your own type by creating a struct
They are useful for grouping together related data
Structs can be declared outside of a contract and imported in another contract

In the example contract below, To do list smart contract is used to illustrate 'structs'
*/
pragma solidity ^0.8.13;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todos;

    function create(string memory _text) public {
        // 3 ways to initialize a struct
        // - calling it like a function
        todos.push(Todo(_text, false));

        // key value mapping
        todos.push(Todo({text: _text, completed: false}));

        // initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;

        // todo.completed initialized to false

        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function
    function get(uint256 _index)
        public
        view
        returns (string memory text, bool completed)
    {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function update(uint256 _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
