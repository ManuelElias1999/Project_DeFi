# DEFI Token Farm

This repository contains smart contracts for a DEFI (Decentralized Finance) token farm project. The main purpose of the project is to allow users to stake their tokens and earn additional rewards in the form of another token.

## Project Purpose

The DEFI Token Farm project serves to:

- Enable users to stake their ERC-20 tokens and earn additional rewards.
- Provide a decentralized platform for stake management and rewards distribution.
- Incentivize participation in the blockchain network by rewarding users for keeping their tokens staked.

## Project Functionality

The project functions as follows:

1. **JamToken (JamToken.sol Contract)**: This contract defines the ERC-20 token called JAM Token. It is the token that users can stake in the token farm.

2. **StellarToken (StellarToken.sol Contract)**: This contract defines another ERC-20 token called Stellar Token (SET). This token is used as a reward for users participating in the token farm.

3. **TokenFarm (TokenFarm.sol Contract)**: This contract manages the staking of tokens and the distribution of rewards. It allows users to stake their JAM Tokens and receive rewards in SET Tokens. The contract also allows the owner to issue rewards to the stakers.

## Functionality of Each Code

- **JamToken.sol**: Defines the ERC-20 token JAM Token. It allows token transfer, approval, and allowance management.

- **StellarToken.sol**: Defines the ERC-20 token Stellar Token (SET). It provides the same functionalities as JamToken.sol.

- **TokenFarm.sol**: Manages the staking of tokens and the distribution of rewards. It allows users to stake their JAM Tokens, receive rewards in SET Tokens, and allows the owner to issue rewards to the stakers.

## License

This project is under the MIT License.
