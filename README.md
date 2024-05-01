## Jogo NFT de Pokemon.

### Mais atribuições de batalhas: 


function battleElementAdvantage(uint _attackingPokemon, uint _defendingPokemon) public onlyOwnerOf(_attackingPokemon) {
    Pokemon storage attacker = pokemons[_attackingPokemon];
    Pokemon storage defender = pokemons[_defendingPokemon];

    if (attacker.type == "Fire" && defender.type == "Grass") {
        attacker.level += 3; 
        defender.level += 1;
    } else if (attacker.type == "Water" && defender.type == "Fire") {
        attacker.level += 3; 
        defender.level += 1;
    } else if (attacker.type == "Grass" && defender.type == "Water") {
        attacker.level += 3; 
        defender.level += 1;
    } else if (attacker.type == "Electric" && (defender.type == "Water" || defender.type == "Flying")) {
        attacker.level += 3; 
        defender.level += 1;
    } else if (attacker.type == "Flying" && (defender.type == "Grass" || defender.type == "Bug")) {
        attacker.level += 3; 
        defender.level += 1;
    } else if (attacker.type == "Bug" && (defender.type == "Grass" || defender.type == "Psychic")) {
        attacker.level += 3; 
        defender.level += 1;
    } else if (attacker.type == "Psychic" && (defender.type == "Fighting" || defender.type == "Poison")) {
        attacker.level += 3; 
        defender.level += 1;
    } else if (attacker.type == "Poison" && (defender.type == "Grass" || defender.type == "Fairy")) {
        attacker.level += 3; 
        defender.level += 1;
    } else if (attacker.type == "Fighting" && (defender.type == "Normal" || defender.type == "Ice")) {
        attacker.level += 3; 
        defender.level += 1;
    } else if (attacker.type == "Ice" && (defender.type == "Grass" || defender.type == "Dragon")) {
        attacker.level += 3; 
        defender.level += 1;
    } else if (attacker.type == "Dragon" && defender.type == "Dragon") {
        attacker.level += 3; 
        defender.level += 1;
    } else {
        //batalha normal
        if (attacker.level >= defender.level) {
            attacker.level += 2;
            defender.level += 1;
        } else {
            attacker.level += 1;
            defender.level += 2;
        }
    }
}
