// Return summation of every number below and up to including n
func calculate_sum(n: felt) -> (sum: felt) {
    if (n == 1) {
        return (1,);
    }   else {
        let (res) = calculate_sum(n - 1);
        return (res + n,);
    }
}
