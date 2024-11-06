// native_token_minting_control.aiken

validator {
  // Validates that the minting transaction is signed by the correct key
  fn validate_minting_with_authorization(tx: Tx, authorized_pubkey: PubKeyHash, minting_policy: PubKeyHash, amount: Value) -> Bool {
    let signer = tx.signatories[0]  // First signer of the transaction

    // Ensure the signer is the authorized minter and validate the mint
    let valid_signer = signer == authorized_pubkey
    let valid_minting = validate_minting(tx, minting_policy, amount)

    // Both conditions must be true for the minting to be valid
    valid_signer && valid_minting
  }
}


