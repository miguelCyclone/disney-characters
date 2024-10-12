use starknet::ContractAddress;

use snforge_std::{declare, ContractClassTrait, DeclareResultTrait};

use project_name::IDisneyCharactersSafeDispatcher;
use project_name::IDisneyCharactersSafeDispatcherTrait;
use project_name::IDisneyCharactersDispatcher;
use project_name::IDisneyCharactersDispatcherTrait;

fn deploy_contract(name: ByteArray) -> ContractAddress {
    let contract = declare(name).unwrap().contract_class();
    let (contract_address, _) = contract.deploy(@ArrayTrait::new()).unwrap();
    contract_address
}

#[test]
fn test_add_character() {
    let contract_address = deploy_contract("DisneyCharacters");

    let dispatcher = IDisneyCharactersDispatcher { contract_address };

    let character_before = dispatcher.get_mapping(1);
    assert(character_before == 0, 'Shall be Unkown Character');

    dispatcher.set_mapping(1, 'Belle');

    let character_after = dispatcher.get_mapping(1);
    assert(character_after == 'Belle', 'Wrong Character Belle');
}

#[test]
fn test_add_character_two() {
    let contract_address = deploy_contract("DisneyCharacters");

    let dispatcher = IDisneyCharactersDispatcher { contract_address };

    let character_before = dispatcher.get_mapping(2);
    assert(character_before == 0, 'Shall be Unkown Character');

    dispatcher.set_mapping(2, 'Simba');

    let character_after = dispatcher.get_mapping(2);
    assert(character_after == 'Simba', 'Wrong Character Simba');
}