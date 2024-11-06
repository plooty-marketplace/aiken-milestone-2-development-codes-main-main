validator stake_nft {
  fn(nft: Asset, staking_time: Int, self: Transaction) {
    trace @"Staking NFT for time:": staking_time

    nft_owner = self.signer

    valid_staking_time = staking_time > 0

    if nft_owner == nft.owner && valid_staking_time {
      success
    } else {
      trace @"Error: Invalid staking operation"
      fail
    }
  }
}
