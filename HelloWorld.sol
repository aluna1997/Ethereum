pragma solidity ^0.5.1;

contract HelloWorld {
    //Variables
    address public owner;
    string public name;
    
    //Constructor
    constructor(string memory _name) public {
        owner = msg.sender;
        name = _name;
    }
    
    //Funciones
    function greet() public pure returns(string memory){
        return "Hola Mundo";
    }

    function setName(string memory _name) public payable{
        name = _name;
    }
    
    function deposit() public payable{
        require(msg.value == 1 ether);
    }
    
    function withdraw() public payable{
        require(msg.sender == owner);
        msg.sender.transfer(address(this).balance);
    }
    
    function checkBalance() public view returns(uint){
        return address(this).balance;
    }
    
}
