pragma  solidity ^0.4.18;

contract BuyTicket {
    address owner;
    uint public tickets;
    uint constant price = 1 ether;
    mapping (address => uint) public purchasers;

    function BuyTicket() {
        owner = msg.sender;
        tickets = 8;
    }
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    function buyTickets(uint amount) onlyOwner public payable {
        if (msg.value != (amount * price) || amount > tickets) {
            throw;
        }
        purchasers[msg.sender] += amount;
        tickets -= amount;
    }
}