// Function to initialize a liquidity pool with two tokens
pub fn initialize_pool(token_a: Token, token_b: Token, fee_percentage: f64) -> LiquidityPool {
    LiquidityPool {
        token_a,
        token_b,
        total_liquidity: 0,
        fee_percentage,
    }
}

// Function to add liquidity to the pool
pub fn add_liquidity(pool: &mut LiquidityPool, amount_a: u64, amount_b: u64) -> Result<(), String> {
    pool.token_a.amount += amount_a;
    pool.token_b.amount += amount_b;
    pool.total_liquidity += amount_a; // Simplified to use token_a for liquidity metric
    Ok(())
}

// Function to remove liquidity from the pool
pub fn remove_liquidity(pool: &mut LiquidityPool, amount_a: u64, amount_b: u64) -> Result<(), String> {
    if amount_a > pool.token_a.amount || amount_b > pool.token_b.amount {
        return Err("Not enough liquidity".to_string());
    }
    pool.token_a.amount -= amount_a;
    pool.token_b.amount -= amount_b;
    pool.total_liquidity -= amount_a;
    Ok(())
}
