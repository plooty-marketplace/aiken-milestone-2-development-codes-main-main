
// native_token_deploy.aiken

validator {
  // Combines minting and burning logic into a single smart contract
  fn mint_or_burn(tx: Tx, authorized_pubkey: PubKeyHash, policy: PubKeyHash, amount: Value) -> Bool {
    let is_mint = tx.mint.len > 0
    let is_burn = tx.burn.len > 0

    if is_mint {
      validate_minting_with_authorization(tx, authorized_pubkey, policy, amount)
    } else if is_burn {
      validate_burning(tx, policy, amount)
    } else {
      // No valid mint or burn action detected
      false
    }
  }
}
