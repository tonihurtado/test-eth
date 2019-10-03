pragma solidity >=0.5.0 <0.6.0;

contract Asignatura {
    
    address public profesor;
    
    string public nombre;
    string public curso;
    
    Evaluacion[] public evaluaciones;
    Alumno[] public alumnos;
    
    address[] public matriculas;
    
    
    struct Evaluacion{
        string nombre;
        uint fecha;
        uint puntos;
    }
    
    struct Alumno{
        address alumno;
        string nombre;
        string email;
    }

    constructor(
        string memory _nombre,
        string memory _curso
    ) public {
        
        profesor = msg.sender;
        nombre = _nombre;
        curso = _curso;
    }
    
    modifier restricted() {
        require(msg.sender == profesor);
        _;
    }
    
    function creaEvaluacion(
        string memory _nombre,
        uint _fecha,
        uint _puntos
    ) public restricted {
        
        evaluaciones.push(Evaluacion({
           nombre: _nombre,
           fecha: _fecha,
           puntos: _puntos
        }));
    }
    
    function evaluacionesLength() public view returns(uint) {
        return evaluaciones.length;
    }
    
    function automatricula(
        string memory _nombre,
        string memory _email
    ) public {
        
        require( bytes(_nombre).length > 0, "Debes especificar un nombre");
        
        matriculas.push(msg.sender);
        
        alumnos.push(Alumno({
            alumno: msg.sender,
            nombre: _nombre,
            email: _email
        }));
    }
    
    
    function matriculasLength() public view returns(uint) {
        return matriculas.length;
    }
}