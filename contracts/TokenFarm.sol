// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "contracts/JamToken.sol";
import "contracts/StellarToken.sol";


contract TokenFarm {

    // Declaraciones iniciales
    string public name = "Stellar Token Farm";
    address public owner;
    JamToken public jamToken;
    StellarToken public stellarToken;

    // Estructuras de datos
    address [] public stakers;
    mapping(address => uint) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isStaking;

    // Constructor
    constructor(StellarToken _stellarToken, JamToken _jamToken){
        stellarToken = _stellarToken;
        jamToken = _jamToken;
        owner = msg.sender;
    }

    // Stake de tokens
    function stakeTokens(uint _amount) public {
        // Se requiere una cantidad mayor a 0
        require(_amount > 0, "La cantidad no puede ser menor a 0");
        // Transferir tokens JAM al Smart Contract principal
        jamToken.transferFrom(msg.sender,address(this), _amount);
        // Actualizar el saldo del staking
        stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;
        // Guardar el staker
        if (hasStaked[msg.sender]){
            stakers.push(msg.sender);
        }
        // Actualizar el estado del staking
        isStaking[msg.sender] = true;
        hasStaked[msg.sender] = true;
    }

    // Quitar el staking de los tokens
    function unstakeTokens() public {
        // Saldo del staking de un usuario
        uint balance = stakingBalance[msg.sender];
        // Se rquierere una cantidad superior a 0
        require(balance > 0, "El balance del staking es 0");
        // Transferencia de los tokens al usuario
        jamToken.transfer(msg.sender, balance);
        // Resetea el balance de staking del usuario
        stakingBalance[msg.sender] = 0;
        // Actualizar el estado del staking
        isStaking[msg.sender] = false;
    }

    // Emision de tokens (recompensas)
    function issueTokens() public {
        // Unicamente ejecutable por el owner
        require(msg.sender == owner, "No eres el owner");
        // Emitir tokens a todos los stakers
        for (uint i=0; i < stakers.length; i++){
            address recipent = stakers[i];
            uint balance = stakingBalance[recipent];
            if (balance > 0){
                stellarToken.transfer(recipent, balance);
            }
        }
    }
}