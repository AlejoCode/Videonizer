pragma solidity ^0.4.18;

contract Videonizer {

    address owner;
    uint videoPrice = 3000;
    
    function Videonizer() payable {
        owner = msg.sender;
    }
    
    function PayMore() payable {}


    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

   // modifier haveMoney {
  //      require(msg.value >= videoPrice);
  //      _;
  //  }

    
    struct Student {
        string fName;
        string lName;
        bool haveVideo;
    }

    mapping (address => Student) students;
    address[] public studentsAccounts;

    function setStudent(address _address, string _fName, string _lName) public {
        var student = students[_address];

        student.fName = _fName;
        student.lName = _lName;
        student.haveVideo = false;

        studentsAccounts.push(_address) -1;
    }

    function getStudents() view public returns (address[]) {
        return studentsAccounts;
    }

    function getStudent(address _address) view public returns (string, string) {
        return (students[_address].fName, students[_address].lName);
    }

    function buyVideo(address _address) public payable {
        msg.sender.transfer(videoPrice);
        students[_address].haveVideo = true;
    }

    function PayVideo() public payable onlyOwner {
        for(uint x = 0 ; x < studentsAccounts.length; x++) {
            studentsAccounts[x].transfer(videoPrice);
        }
    }
    
    function ContractBalance() view returns (uint) {
        return this.balance;
    }
}