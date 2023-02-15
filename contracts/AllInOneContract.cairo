// ######## Ex 01
// # Using a simple public contract function
// In this exercice, you need to:
// - Use this contract's claim_points() function
// - Your points are credited by the contract

// # What you'll learn
// - General smart contract syntax
// - Calling a function

// ######## General directives and imports
//
//

%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.starknet.common.syscalls import get_contract_address, get_caller_address
from starkware.cairo.common.alloc import alloc
from contracts.utils.Iex10b import Iex10b
from contracts.token.IERC20 import IERC20
@contract_interface
namespace ex01 {
    func claim_points() {
    }
}

@contract_interface
namespace ex02 {
    func my_secret_value() -> (my_secret_value: felt) {
    }

    func claim_points(my_value: felt) {
    }
}

@contract_interface
namespace ex03 {
    func increment_counter() {
    }

    func reset_counter() {
    }

    func decrement_counter() {
    }

    func claim_points() {
    }
}

@contract_interface
namespace ex04 {
    func user_slots(account: felt) -> (user_slot: felt) {
    }

    func values_mapped(slot: felt) -> (value: felt) {
    }

    func assign_user_slot() {
    }

    func claim_points(expected_value: felt) {
    }
}

@contract_interface
namespace ex05 {
    func user_values(account: felt) -> (user_value: felt) {
    }

    func assign_user_slot() {
    }

    func copy_secret_value_to_readable_mapping() {
    }

    func claim_points(expected_value: felt) {
    }
}

@contract_interface
namespace ex06 {
    func user_values(account: felt) -> (user_value: felt) {
    }

    func assign_user_slot() {
    }

    func external_handler_for_internal_function(a_value: felt) {
    }

    func claim_points(expected_value: felt) {
    }
}

@contract_interface
namespace ex07 {
    func claim_points(value_a: felt, value_b: felt) {
    }
}

@contract_interface
namespace ex08 {
    func claim_points() {
    }

    func set_user_values(account: felt, array_len: felt, array: felt*) {
    }
}

@contract_interface
namespace ex09 {
    func claim_points(array_len: felt, array: felt*) {
    }
}

@contract_interface
namespace ex10 {
    func ex10b_address() -> (ex10b_address: felt) {
    }

    func claim_points(secret_value_i_guess: felt, next_secret_value_i_chose: felt) {
    }
}

@contract_interface
namespace ex14 {
    func claim_points() {
    }
}

@external
func validate_various_exercises{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    // This call should collect at least 20 points from various exercises to get tokens to the contract.
    let (currentContractAddress) = get_contract_address();
    // Now solving exercise 1
    // let (
    //     exercise_1_contract_address
    // ) = 0x29e2801df18d7333da856467c79aa3eb305724db57f386e3456f85d66cbd58b;
    ex01.claim_points(contract_address=0x29e2801df18d7333da856467c79aa3eb305724db57f386e3456f85d66cbd58b);

    // Now solving exercise 2
    // let (
    //     exercise_2_contract_address
    // ) = 0x18ef3fa8b5938a0059fa35ee6a04e314281a3e64724fe094c80e3720931f83f;
    let (ex02_secret_value) = ex02.my_secret_value(contract_address=0x18ef3fa8b5938a0059fa35ee6a04e314281a3e64724fe094c80e3720931f83f);
    ex02.claim_points(contract_address=0x18ef3fa8b5938a0059fa35ee6a04e314281a3e64724fe094c80e3720931f83f, my_value=ex02_secret_value);

    // Now solving exercise 3
    // let (
    //     exercise_3_contract_address
    // ) = 0x79275e734d50d7122ef37bb939220a44d0b1ad5d8e92be9cdb043d85ec85e24;
    ex03.reset_counter(contract_address=0x79275e734d50d7122ef37bb939220a44d0b1ad5d8e92be9cdb043d85ec85e24);
    ex03.increment_counter(contract_address=0x79275e734d50d7122ef37bb939220a44d0b1ad5d8e92be9cdb043d85ec85e24);  // each increment counter adds 2 points
    ex03.increment_counter(contract_address=0x79275e734d50d7122ef37bb939220a44d0b1ad5d8e92be9cdb043d85ec85e24);
    ex03.increment_counter(contract_address=0x79275e734d50d7122ef37bb939220a44d0b1ad5d8e92be9cdb043d85ec85e24);
    ex03.increment_counter(contract_address=0x79275e734d50d7122ef37bb939220a44d0b1ad5d8e92be9cdb043d85ec85e24);
    ex03.decrement_counter(contract_address=0x79275e734d50d7122ef37bb939220a44d0b1ad5d8e92be9cdb043d85ec85e24);  // each decrement counter subtracts 1 point
    ex03.claim_points(contract_address=0x79275e734d50d7122ef37bb939220a44d0b1ad5d8e92be9cdb043d85ec85e24);

    // Now solving exercise 4
    // let (
    //     exercise_4_contract_address
    // ) = 0x2cca27cae57e70721d0869327cee5cb58098af4c74c7d046ce69485cd061df1;
    ex04.assign_user_slot(contract_address=0x2cca27cae57e70721d0869327cee5cb58098af4c74c7d046ce69485cd061df1);
    let (user_slot) = ex04.user_slots(
        contract_address=0x2cca27cae57e70721d0869327cee5cb58098af4c74c7d046ce69485cd061df1, account=currentContractAddress
    );
    let (value) = ex04.values_mapped(contract_address=0x2cca27cae57e70721d0869327cee5cb58098af4c74c7d046ce69485cd061df1, slot=user_slot);
    ex04.claim_points(contract_address=0x2cca27cae57e70721d0869327cee5cb58098af4c74c7d046ce69485cd061df1, expected_value=value - 32);

    // Now solving exercise 5
    // let (
    //     exercise_5_contract_address
    // ) = 0x399a3fdd57cad7ed2193bdbb00d84553cd449abbdfb62ccd4119eae96f827ad;
    ex05.assign_user_slot(contract_address=0x399a3fdd57cad7ed2193bdbb00d84553cd449abbdfb62ccd4119eae96f827ad);
    ex05.copy_secret_value_to_readable_mapping(contract_address=0x399a3fdd57cad7ed2193bdbb00d84553cd449abbdfb62ccd4119eae96f827ad);
    let (user_value) = ex05.user_values(
        contract_address=0x399a3fdd57cad7ed2193bdbb00d84553cd449abbdfb62ccd4119eae96f827ad, account=currentContractAddress
    );
    ex05.claim_points(contract_address=0x399a3fdd57cad7ed2193bdbb00d84553cd449abbdfb62ccd4119eae96f827ad, expected_value=user_value);

    // Now solving exercise 6
    // let (
    //     exercise_6_contract_address
    // ) = 0x718ece7af4fb1d9c82f78b7a356910d8c2a8d47d4ac357db27e2c34c2424582;
    ex06.assign_user_slot(contract_address=0x718ece7af4fb1d9c82f78b7a356910d8c2a8d47d4ac357db27e2c34c2424582);
    ex06.external_handler_for_internal_function(
        contract_address=0x718ece7af4fb1d9c82f78b7a356910d8c2a8d47d4ac357db27e2c34c2424582, a_value=0
    );
    let (user_value) = ex06.user_values(
        contract_address=0x718ece7af4fb1d9c82f78b7a356910d8c2a8d47d4ac357db27e2c34c2424582, account=currentContractAddress
    );
    ex06.claim_points(contract_address=0x718ece7af4fb1d9c82f78b7a356910d8c2a8d47d4ac357db27e2c34c2424582, expected_value=user_value);

    // Now solving exercise 7
    // let (
    //     exercise_7_contract_address
    // ) = 0x3a1ad1cde69c9e7b87d70d2ea910522640063ccfb4875c3e33665f6f41d354a;
    ex07.claim_points(contract_address=0x3a1ad1cde69c9e7b87d70d2ea910522640063ccfb4875c3e33665f6f41d354a, value_a=50, value_b=0);

    // Now solving exercise 8

    // let (
    //     exercise_8_contract_address
    // ) = 0x15fa754c386aed6f0472674559b75358cde49db8b2aba8da31697c62001146c;
    let (numbers_array: felt*) = alloc();
    assert [numbers_array] = 10;
    assert [numbers_array + 1] = 10;
    assert [numbers_array + 2] = 10;
    assert [numbers_array + 3] = 10;
    assert [numbers_array + 4] = 10;
    assert [numbers_array + 5] = 10;
    assert [numbers_array + 6] = 10;
    assert [numbers_array + 7] = 10;
    assert [numbers_array + 8] = 10;
    assert [numbers_array + 9] = 10;
    assert [numbers_array + 10] = 10;

    ex08.set_user_values(
        contract_address=0x15fa754c386aed6f0472674559b75358cde49db8b2aba8da31697c62001146c,
        account=currentContractAddress,
        array_len=11,
        array=numbers_array,
    );
    ex08.claim_points(contract_address=0x15fa754c386aed6f0472674559b75358cde49db8b2aba8da31697c62001146c);

    // Now solving exercise 9

    // let (
    //     exercise_9_contract_address
    // ) = 0x2b9fcc1cfcb1ddf4663c8e7ac48fc87f84c91a8c2b99414c646900bf7ef5549;
    let (numbers_array: felt*) = alloc();
    assert [numbers_array] = 220;
    assert [numbers_array + 1] = 73;
    assert [numbers_array + 2] = 25;
    assert [numbers_array + 3] = 10;
    assert [numbers_array + 4] = 1;
    ex09.claim_points(
        contract_address=0x2b9fcc1cfcb1ddf4663c8e7ac48fc87f84c91a8c2b99414c646900bf7ef5549, array_len=5, array=numbers_array
    );

    // Now solving exercise 10
    // let (
    //     exercise_10_contract_address
    // ) = 0x8415762f4b0b0f44e42ac1d103ac93c3ea94450a15bb65b99bbcc816a9388;
    let (exercise_10b_address) = ex10.ex10b_address(contract_address=0x8415762f4b0b0f44e42ac1d103ac93c3ea94450a15bb65b99bbcc816a9388);
    let (secret_value) = Iex10b.secret_value(contract_address=exercise_10b_address);
    ex10.claim_points(
        contract_address=0x8415762f4b0b0f44e42ac1d103ac93c3ea94450a15bb65b99bbcc816a9388,
        secret_value_i_guess=secret_value,
        next_secret_value_i_chose=89,
    );

    return ();
}

@external
func call_ex_14_contract{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    // let (address) = 0xed7ddffe1370fbbc1974ab8122d1d9bd7e3da8d829ead9177ea4249b4caef1;
    ex14.claim_points(contract_address=0xed7ddffe1370fbbc1974ab8122d1d9bd7e3da8d829ead9177ea4249b4caef1);
    return ();
}

// @external
// func transfer_contract_balance_to_wallet{
//     syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr
// }(address_to_transfer : felt, erc_20_token_address : felt):
//     let (current_contract_address) = get_contract_address()
//     let (balance) = IERC20.balanceOf(
//         contract_address=erc_20_token_address, account=current_contract_address
//     )
//     IERC20.transfer(
//         contract_address=erc_20_token_address, recipient=address_to_transfer, amount=balance
//     )

// return ()
// end
