validator delist_nft {
  fn(listing_id: ByteArray, self: Transaction) {
    trace @"Delisting NFT with ID:": listing_id

    nft_owner = self.signer

    is_owner_valid = self.asset.owner == nft_owner

    if is_owner_valid {
      success
    } else {
      trace @"Error: Unauthorized delisting attempt"
      fail
    }
  }
}
