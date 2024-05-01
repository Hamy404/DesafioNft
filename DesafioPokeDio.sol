// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

//Importar do openzeppelin.com o padrão ERC-721
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract PokeDIO is ERC721{
    // Atribuição de propriedades para um dado
    struct Pokemon{
        string name;
        uint level;
        string img;
    }
    //Armazenamento de mais elementos    
    Pokemon[] public pokemons;
    //Informar o owner dos elementos    
    address public gameOwner;

    constructor () ERC721 ("PokeDIO", "PKD"){
        //Identificar que o criador da carteira é o owner.
        gameOwner = msg.sender;

    } 

    modifier onlyOwnerOf(uint _monsterId) {
        //Exigir que apenas o owner do elemento possa usá-lo
        require(ownerOf(_monsterId) == msg.sender,"Apenas o dono pode batalhar com este Pokemon");
        _;

    }
    //Desenvolvimento de batalha
    function battle(uint _attackingPokemon, uint _defendingPokemon) public onlyOwnerOf(_attackingPokemon){
        Pokemon storage attacker = pokemons[_attackingPokemon];
        Pokemon storage defender = pokemons[_defendingPokemon];

         if (attacker.level >= defender.level) {
            attacker.level += 2;
            defender.level += 1;
        }else{
            attacker.level += 1;
            defender.level += 2;
        }
    }

    function createNewPokemon(string memory _name, address _to, string memory _img) public {
        //Apenas o Sender(Primary owner) pode criar novos elementos
        require(msg.sender == gameOwner, "Apenas o dono do jogo pode criar novos pokemons");
        //Atribuição do ID de um novo elemento
        uint id = pokemons.length;
        //Enviar para armazenamento no array Pokemon[]
        pokemons.push(Pokemon(_name, 1,_img));
        //Criação do token do elemento.
        _safeMint(_to, id);
    }


}