pragma solidity ^0.5.1;

contract VotacionesDApp{
    // Variables
    mapping(bytes8 => bool) public candidatos;
    mapping(bytes8 => uint256) public votosCandidatos;
    mapping(address => bool) public permitidos;
    address public owner;
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    
    modifier puedeVotar(){
        require(permitidos[msg.sender], "No estas en el padrón");
        permitidos[msg.sender] = false;
        _;
    }

     
    // Constructor
    constructor() public{
        owner = msg.sender;
    }
    
    // Fuciones
    function registrarCandidato(bytes8 _candidato) public onlyOwner(){
        candidatos[_candidato] = true;
    }
    
    function permitirVotante(address _votante) public onlyOwner(){
        permitidos[_votante] = true;
    }
    
    function votar(bytes8 _candidato) public puedeVotar(){
        require(candidatos[_candidato], "Tu candidato no existe");
        votosCandidatos[_candidato] += 1;
    }
    
    
    
}
