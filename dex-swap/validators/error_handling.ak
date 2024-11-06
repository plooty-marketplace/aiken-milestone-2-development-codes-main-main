pub enum DexError {
    InsufficientLiquidity,
    InsufficientBalance,
    InvalidSwap,
}

// Implement Display for DexError
impl std::fmt::Display for DexError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            DexError::InsufficientLiquidity => write!(f, "Not enough liquidity in the pool."),
            DexError::InsufficientBalance => write!(f, "User does not have enough balance."),
            DexError::InvalidSwap => write!(f, "Invalid swap operation."),
        }
    }
}
