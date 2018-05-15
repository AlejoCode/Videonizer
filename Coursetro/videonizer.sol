pragma solidity ^0.4.18;

contract Videonizer {

    address owner;
    uint unActiveStudents = 0;
    uint activeStudents = 0;
    uint percentage = 0;
    uint constant videoPrice = 20 ether;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function Payable() payable public {
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    modifier haveMoney {
        require (msg.value == videoPrice);
        _;
    }
    
    modifier isStudent {
        require (students[msg.sender].status);
            _;
    }
    
    struct Student {
        address sAddress;
        string fName;
        string lName;
        bool status;
        bool haveVideo;
        uint tokens;
    }

    mapping (address => Student) students;
    address[] public studentsAccounts;

    function setStudent(string _fName, string _lName) public {
        
//        var student = students[_address];
        students[msg.sender] = Student ({
            sAddress: msg.sender,
            fName: _fName,
            lName: _lName,
            haveVideo: false,
            status: false,
            tokens: 0
        });
        
    }
    
    function buyVideo() haveMoney public payable {
        
        students[msg.sender].tokens += 1;
        students[msg.sender].haveVideo = true;
        students[msg.sender].status = true;
        studentsAccounts.push(msg.sender) -1;
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

    function PayContract() onlyOwner payable public {
        percentage = (((address(this).balance) / (studentsAccounts.length)));
        for(uint x = 0 ; x < studentsAccounts.length; x++) {
            studentsAccounts[x].transfer(percentage);
        }
    }
    
    function ContractBalance() view public returns (uint) {
        return address(this).balance;
    }
}
