%lang starknet
from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import unsigned_div_rem

// Using binary operations return:
// - 1 when pattern of bits is 01010101 from LSB up to MSB 1, but accounts for trailing zeros
// - 0 otherwise

// 000000101010101 PASS
// 010101010101011 FAIL
// MAX_VAL = 
func pattern{bitwise_ptr: BitwiseBuiltin*, range_check_ptr}(
    n: felt, idx: felt, exp: felt, broken_chain: felt
) -> (true: felt) {

    %{  print(f'Value is {ids.n} : {bin(ids.n).replace("0b", "")}')%}

    let (shifted, remainder) = unsigned_div_rem(n, 2);
    %{  print(f' shifted: {ids.shifted} : {bin(ids.shifted).replace("0b", "")}')%}

    let (res_xor) = bitwise_xor(shifted, n);
    %{  print(f' res_xor: {ids.res_xor} : {bin(ids.res_xor).replace("0b", "")}')%}

    let (res) = bitwise_and(res_xor, res_xor + 1);
    %{  print(f' res: {ids.res} : {bin(ids.res).replace("0b", "")}')%}

    if (res == 0) {
        return (1,);
        } else { 
        return (0,);
        }
    
}
