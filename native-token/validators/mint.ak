// native_token_minting.aiken

validator {
  // Validates minting rules for the native token
  fn validate_minting(tx: Tx, minting_policy: PubKeyHash, amount: Value) -> Bool {
    let mint = tx.mint[0] // Access the first minting transaction
    
    // Ensure that only the allowed policy can mint the token
    let valid_minter = mint.policy == minting_policy
    
    // Ensure the minting amount is positive
    let valid_amount = mint.amount > 0

    // Both conditions must be true for the mint to be valid
    valid_minter && valid_amount
  }
}
