pragma solidity ^0.5.1;

contract FALV{
    /*
    OPTIONAL
    - name 
    - symbol
    - decimal
    
    REQUIRED
    - transfer
    - transferFrom
    - totalSupply
    - balanceOf
    - approve
    - allowance
    
    Events: Approval, Transfer
    */
    
    string public name = "FALV Coin";
    string public symbol = "FALV";
    uint256 public totalSupply;
    //Al balanceOf le pasamos la direccion y nos regresa el saldo.
    mapping(address => mapping(address => uint256)) public allowance;
    mapping(address => uint256) public balanceOf;
    
    constructor(uint256 _initialSupply) public{
        totalSupply = _initialSupply;
        balanceOf[msg.sender] = totalSupply;
    }
    
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _from, address indexed _to, uint256 _value);
    
    
    function transfer(address _to, uint256 _value) public returns(bool){
        require(balanceOf[msg.sender] >= _value);
        
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }
    
    
    function transferFrom(address _from, address _to, uint256 _value) public returns(bool){
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
        
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        
        emit Transfer(_from, _to, _value);
        
        return true;
        
    }
    
    
    function approve(address _spender, uint256 _value) public returns (bool){
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
        
    }
    
    
    
    
}
