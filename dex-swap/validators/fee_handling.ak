pub struct FeeAccount {
    total_fees_collected: u64,
}

// Function to collect fees from the pool after a swap
pub fn collect_fees(fee_account: &mut FeeAccount, fee_amount: u64) {
    fee_account.total_fees_collected += fee_amount;
}
