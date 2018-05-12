pragma solidity ^0.4.18;

contract Videonizer {

    address owner;
    uint activeStudents = 0;
    uint percentage = 0;
    uint constant videoPrice = 20 ether;
    
    function Videonizer() {
        owner = msg.sender;
    }
    
    function Payable() payable {
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    //modifier haveMoney {
     //  require(msg.value >= videoPrice);
     //  _;
  //}
    
    struct Student {
        address sAddress;
        string fName;
        string lName;
        bool haveVideo;
        uint tokens;
    }

    mapping (address => Student) students;
    address[] public studentsAccounts;

    function setStudent(address _address, string _fName, string _lName) public payable {
        
        if (msg.value != videoPrice) {
            throw;
        }
        
        var student = students[_address];
        
        student.sAddress = _address;
        student.fName = _fName;
        student.lName = _lName;
        student.haveVideo = true;
        student.tokens += 1;

        studentsAccounts.push(_address) -1;
        activeStudents += 1;
    }
    
    function getActiveStudents() view public returns (uint) {
        return activeStudents;
    }
    
    function getStudents() view public returns (address[]) {
        return studentsAccounts;
    }

    function getStudent(address _address) view public returns (address, string, string ,bool, uint) {
        return (students[_address].sAddress, 
            students[_address].fName, 
            students[_address].lName, 
            students[_address].haveVideo,
            students[_address].tokens);
    }

    function PayContract() onlyOwner payable {
        percentage = (((address(this).balance) / (studentsAccounts.length)));
        for(uint x = 0 ; x < studentsAccounts.length; x++) {
            studentsAccounts[x].transfer(percentage);
        }
    }
    
    function ContractBalance() view returns (uint) {
        return this.balance;
    }
}