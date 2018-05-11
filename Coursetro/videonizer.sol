pragma solidity ^0.4.18;

contract Videonizer {

    struct Student {
        uint fName;
        uint lName;
    }

    mapping (address => Student) students;
    address[] public studentsAccounts;

    function setStudent (address _address, uint _fName, string _lName) public {
        var student = students[_address];

        student.fName = _fName;
        student.lName = _localName;
    }
}