## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Decentralized Lottery System

We built a Decentralized Lottery System where:

- Users can participate by sending 0.01 ETH to the contract.
- After a fixed duration, the contract manager can select a winner randomly.
- The winner receives the entire prize pool.
- The lottery resets automatically after a winner is selected.

### Key Features

- **Participation**: Users can join the lottery by calling the `participate()` function.
- **Winner Selection**: The manager can call `selectWinner()` to randomly select a winner and transfer the prize pool.
- **Reset Mechanism**: The lottery resets automatically after a winner is selected.

### Security Checks

- Only the manager can select the winner.
- Users cannot participate after the lottery ends.
- The contract prevents division-by-zero errors when selecting a winner with no participants.

### To further enhance:

- **Adding a Frontend**: Build a React frontend using Ethers.js or Wagmi to allow users to interact with the lottery via a web interface.
- **Improving Randomness**: Integrate a more secure randomness solution like Chainlink VRF for production use.
- **Adding Features**: Allow participants to withdraw their funds if the lottery ends with no winner. Add a fee for the manager.
- **Deploying to Mainnet**: Once the contract is thoroughly tested, deploy it to the Ethereum mainnet.

## Project Exercises

This basic lottery smart contract serves as an excellent project exercise for learning and improving your skills in Ethereum smart contract development. By working on this project, you will:

- Gain hands-on experience with Solidity programming.
- Understand the principles of decentralized applications (dApps).
- Learn how to interact with smart contracts using tools like Foundry and Ethers.js.
- Explore security best practices in smart contract development.
- Enhance your knowledge of Ethereum blockchain technology.

## Usage

### Build

```shell
$ forge build
```
### Test
```shell
$ forge test
```
### Deploy
Sample deploy contract on Sepolia: [0x6b7927081a10b72fd8bf5b41a7bb267e18024e68](https://sepolia.etherscan.io/address/0x6b7927081a10b72fd8bf5b41a7bb267e18024e68)

### Cast
```
$ cast <subcommand>
```
### Help
```
$ forge --help
$ anvil --help
$ cast --help
```