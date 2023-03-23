from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

// Implement a function that sums even numbers from the provided array
func sum_even{bitwise_ptr: BitwiseBuiltin*}(arr_len: felt, arr: felt*, run: felt, idx: felt) -> (
    sum: felt
) {
    alloc_locals;
    if (arr_len == idx) {
        return (sum=0);
    }

    let (local is_odd) = bitwise_and(arr[idx], 1);
    let (next_sum) = sum_even(arr_len, arr, run, idx + 1);
    
    let sum = next_sum + arr[idx] * (1 - is_odd);
    
    return (sum=sum);
}
