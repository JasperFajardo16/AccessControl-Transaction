    pragma solidity ^0.4.24;
    
    contract AccessControl {
        address owner;
        string fname;
        string lname;
        uint amount;
        uint balance;
        
        mapping(address => uint) balances;
        
        function AccessControl() public {
            owner = msg.sender;
        }
        
        modifier onlyOwner {
            require(msg.sender == owner, "Not Authorized!");
            _;
        }   
        
        function changeOwner(address _newOwner, string _fname,string  _lname) onlyOwner public {
            if(_newOwner != address(0)) {
                owner = _newOwner;
                fname = _fname;
                lname = _lname;
            }
        }
        
        function SetAccount(string _fname, string _lname) public {
            fname = _fname;
            lname = _lname;
        }
        
        function getAccount() public view returns (address, string, string) {
            return (owner, fname, lname);
        }
        

        function deposit() public payable {
            balances[msg.sender] = msg.value;
        }
        
        function withdraw(uint amount) onlyOwner public {
            require(balances[msg.sender] >= amount);
            balances[msg.sender] -= amount;
            msg.sender.transfer(amount);
        }
        
        function getBalance() public view returns(uint _balance) {
            return address(this).balance;
        }
}       

    
    
