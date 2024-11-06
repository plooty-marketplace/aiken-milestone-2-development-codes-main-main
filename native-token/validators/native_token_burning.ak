// native_token_burning.aiken

validator {
  // Validates burning of the native token
  fn validate_burning(tx: Tx, burn_policy: PubKeyHash, amount: Value) -> Bool {
    let burn = tx.burn[0]  // Access the first burn transaction

    // Ensure that only the allowed policy can burn the token
    let valid_burner = burn.policy == burn_policy
    
    // Ensure the burning amount is positive (burning should always be less than total supply)
    let valid_amount = burn.amount > 0

    // Both conditions must be true for the burn to be valid
    valid_burner && valid_amount
  }

