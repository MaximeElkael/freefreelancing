pragma solidity ^0.4.17;

contract FreelanceJob {
    address public employer;
    address public employee;
    uint public dateOfPayment;
    bool hasBeenPaid;
    bool hasAccepted;
    
    function FreelanceJob(address _employee, uint _daysBeforePaying, uint donation) public payable{
        dateOfPayment = _daysBeforePaying * 86400 + now;
        0xd5aC108a5e5008c92B9A5A3CaF0d6A0E1b5b8c3b.transfer(donation);
        employer = msg.sender;
        employee = _employee;
        hasBeenPaid = false;
        hasAccepted = false;
    }
    
    function acceptContract() public {
        require(msg.sender == employee);
        hasAccepted = true;
    }
    
    function getPaid(uint donation) public payable {
        require(now > dateOfPayment);
        require(msg.sender == employee);
        0xd5aC108a5e5008c92B9A5A3CaF0d6A0E1b5b8c3b.transfer(donation);
        if(!hasBeenPaid){
            hasBeenPaid = true;
            employee.transfer(this.balance);
        }
    }
}