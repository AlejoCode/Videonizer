
pragma solidity ^0.4.18;

contract Videonizer {

    address owner;
    uint unActiveStudents = 0;
    uint activeStudents = 0;
    uint activeteachers = 0;
    uint studentProfit = 0;
    uint teacherProfit = 0;
    uint constant teacherPercentage = 70;
    uint constant studentPercentage = 30;
    uint constant videoPrice = 20 ether;
    address[] public studentsAccounts;
    address[] public teachersAccounts;

    
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
<<<<<<< HEAD
        _;
=======
            _;
>>>>>>> cd0db6607d54f1f6787fd9b0753407b8e52ae87d
    }
    
    struct Student {
        address sAddress;
        string fName;
        string lName;
        bool status;
        bool haveVideo;
        uint tokens;
    }
    
    struct Teacher {
        address sAddress;
        string fName;
        string lName;
        string videoDescription;
        string videoHash;
    }
<<<<<<< HEAD

    event createStudent (
        string firstName,
        string lastName
    );

    event createTeacher (
        string firstName,
        string lastName,
        string videoDescription,
        string videoHash
    );
=======
>>>>>>> cd0db6607d54f1f6787fd9b0753407b8e52ae87d
    
    mapping (address =>Teacher) teachers;

    mapping (address => Student) students;

    function setStudent(string _fName, string _lName) public {
        
        students[msg.sender] = Student ({
            sAddress: msg.sender,
            fName: _fName,
            lName: _lName,
            haveVideo: false,
            status: false,
            tokens: 0
        });
<<<<<<< HEAD
        createStudent(_fName, _lName);
=======
>>>>>>> cd0db6607d54f1f6787fd9b0753407b8e52ae87d
    }
    
    function setTeacher(string _fName, string _lName, string _videoDescription, string _videoHash) onlyOwner public {
        
        teachers[msg.sender] = Teacher ({
            sAddress: msg.sender,
            fName: _fName,
            lName: _lName,
            videoDescription: _videoDescription,
            videoHash: _videoHash
        });
        
        teachersAccounts.push(msg.sender) -1;
        activeteachers += 1;
<<<<<<< HEAD

        createTeacher(_fName, _lName, _videoDescription, _videoHash);        
=======
        
>>>>>>> cd0db6607d54f1f6787fd9b0753407b8e52ae87d
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
        studentProfit = (((((address(this).balance) / (studentsAccounts.length))) * studentPercentage)) / 100;
        teacherProfit = (((((address(this).balance) / (teachersAccounts.length))) * teacherPercentage)) / 100;
        for(uint x = 0; x < studentsAccounts.length; x++) {
            studentsAccounts[x].transfer(studentProfit);
        }
        for(uint y = 0; y < teachersAccounts.length; y++) {
            teachersAccounts[y].transfer(teacherProfit);
        }
    }
    
    function ContractBalance() view public returns (uint) {
        return address(this).balance;
    }
}
