from starkware.cairo.common.uint256 import Uint256, uint256_add

// Modify both functions so that they increment
// supplied value and return it
func add_one(y: felt) -> (val: felt) {
    let val = y + 1;
    return (val,);
}

func add_one_U256{range_check_ptr}(y: Uint256) -> (val: Uint256) {
    tempvar a = Uint256(1, 0);
    let (val, carry) = uint256_add(y, a);
    %{
        print(f"Carry is {ids.carry}]")
    %}
    assert carry = 0;
    return (val,);
}
