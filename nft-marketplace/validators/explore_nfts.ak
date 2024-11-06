validator explore_nfts {
  fn(policy_id: ByteArray, self: Transaction) {
    trace @"Exploring NFTs for policy ID:": policy_id

    nft_collection =
      self.mint
        |> assets.flatten
        |> list.filter(fn(asset) { asset.policy_id == policy_id })

    nft_collection != [] ?
      success :
      trace @"Error: No NFTs found for this policy ID"
      fail
  }
}
