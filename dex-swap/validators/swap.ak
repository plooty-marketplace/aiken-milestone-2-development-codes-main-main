// Function to swap tokens in the pool
pub fn swap_tokens(
    pool: &mut LiquidityPool,
    user_balance: &mut UserBalance,
    swap_request: SwapRequest,
) -> Result<(), String> {
    // Ensure the user has enough tokens
    if swap_request.token_a_amount > user_balance.token_a_balance {
        return Err("Insufficient Token A balance".to_string());
    }

    // Calculate amount of Token B to give based on pool ratio and fee
    let amount_b = (swap_request.token_a_amount as f64 / pool.token_a.amount as f64)
        * pool.token_b.amount as f64;

    // Apply swap fee
    let fee = amount_b * pool.fee_percentage;
    let final_amount_b = amount_b - fee;

    // Update the pool and user balances
    pool.token_a.amount += swap_request.token_a_amount;
    pool.token_b.amount -= final_amount_b as u64;

    user_balance.token_a_balance -= swap_request.token_a_amount;
    user_balance.token_b_balance += final_amount_b as u64;

    Ok(())
}
