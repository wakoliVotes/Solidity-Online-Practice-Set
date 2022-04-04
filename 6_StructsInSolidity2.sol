// SPDX-License-Identifier: MIT

/** Link to original source: 

https://www.tutorialspoint.com/solidity/solidity_structs.htm
Structs
To define a struct, you must use the keyword 'struct'
'struct' defines a data type with more than one member
struct format:
    struct struct_name {
        type1 type_name_1;
        type2 type_name_2;
        type3 type_name_3;
        type4 type_name_4;
    }

Struct types are used to represent a record.
Suppose you want to keep track of your books in a library
You might want to track the following attributes about each book
    - Title
    - Author
    - Subject
    - Book ID
    - Number of pages
    - Year of Publication
    - Book Genre
*/

pragma solidity ^0.8.13;

contract BookStruct {
    struct Book {
        address bookOwnerAddr;
        string title;
        string author;
        string subject;
        string bookGenre;
        uint256 bookId;
        uint256 numPages;
        uint256 yearPublished;
        bool isReadStatus;
    }
    Book book;

    function setBook() public {
        book = Book(
            msg.sender,
            "Learning Solidity",
            "Dr. Kingsman",
            "Programming",
            "Computing",
            446353,
            568,
            2022,
            true
        );
    }
    // Let user enter book details themselves
    function userBookInputs(
        address _bookOwnerAddr,
        string memory _title,
        string memory _author,
        string memory _subject,
        string memory _bookGenre,
        uint256 _bookId,
        uint256 _pages,
        uint256 _yearPublished,
        bool _isReadStatus
        ) public {
             book.bookOwnerAddr = _bookOwnerAddr;
             book.title = _title;
             book.author = _author;
             book.subject = _subject;
             book.bookGenre = _bookGenre;
             book.bookId = _bookId;
             book.numPages = _pages;
             book.yearPublished = _yearPublished;
             book.isReadStatus = _isReadStatus;
    }
    // Access the full book details
    function accessBookDetails() public view returns (Book memory){
        // Only address linked to book can call the function
        require(msg.sender == book.bookOwnerAddr, "not owner of book");
        return book;
    }

    function getBookId() public view returns (uint256) {
        // Ensure address owner can call the function
        require(msg.sender == book.bookOwnerAddr, "not owner of book");
        return book.bookId;
    }

    function getBookReadStatus()
        public
        view
        returns (bool)
    {       
        return book.isReadStatus;
    }
}
