pub fn calculate_fee(transaction_amount: Value, fee_percentage: u64) -> Value {
    let fee = transaction_amount * fee_percentage / 100;
    fee
}
