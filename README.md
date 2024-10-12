# Disney Characters in Cairo

This is a straightforward demonstration of a Cairo smart contract that manages Disney character names by mapping a unique identifier to a character's name. The contract includes a functionality to set and get character names, with an event emitted each time a new character is added.

### Features
- **Mapping Storage**: Each Disney character is stored in a mapping where a numeric identifier is paired with a character name.
- **Event Emission**: Each time a character is added, an event is emitted with the character's name, allowing for easy tracking of changes.
- **Test Suite**: The provided test suite includes two main tests that verify the correct functioning of the mapping and event emission.

### Test Details
- **Test 1**: Verifies adding a character named "Belle" and retrieving the name using an identifier.
- **Test 2**: Verifies adding a character named "Simba" similarly, ensuring the smart contract works for different inputs.

### Challenges Faced
The main challenge was the setup and initialization of the environment, which took longer than initially anticipated. Initially, I aimed to deploy and test the contract on the Starknet Sepolia testnet, but encountered difficulties obtaining tokens from the faucet. I then pivoted to deploying the contract locally using Katana, but ran into compatibility issues with RPC versions in Starknet Foundry. Due to time constraints for submitting this task, I decided to skip the deployment and proceeded with tests using Foundry without RPC contract deployment, successfully demonstrating the core contract logic.

### Notes
This contract is intentionally kept simple. The scope was agreed upon to be minimal, focusing on functionality rather than complexity or extended features.
Build project: `scarb build`
Test project: `scarb test`

Feel free to explore the code and run the tests. Thank you!