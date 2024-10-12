#[starknet::interface]
pub trait IDisneyCharacters<ContractState> {
    fn set_mapping(ref self: ContractState, key: u64, value: felt252);
    fn get_mapping(self: @ContractState, key: u64) -> felt252;
}

#[starknet::contract]
mod DisneyCharacters {
    use starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess, Map};

    #[storage]
    struct Storage {
        disney_characters: Map<u64, felt252>,
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    pub enum Event {
        NewCharacter: NewCharacter
    }

    #[derive(Drop, starknet::Event)]
    pub struct NewCharacter {
        pub name: felt252
    }

    #[abi(embed_v0)]
    impl DisneyCharactersImpl of super::IDisneyCharacters<ContractState> {
        // Function to set a value in the mapping.
        fn set_mapping(ref self: ContractState, key: u64, value: felt252) {
            self.disney_characters.write(key, value);
            self.emit(NewCharacter { name: value });
        }

        // Function to get a value from the mapping.
        fn get_mapping(self: @ContractState, key: u64) -> felt252 {
            self.disney_characters.read(key)
        }
    }
}