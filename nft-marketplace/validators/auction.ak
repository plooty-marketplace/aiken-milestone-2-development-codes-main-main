validator auction_nft {
  fn(nft: Asset, min_bid: Int, auction_end_time: Int, self: Transaction) {
    trace @"Starting auction for NFT:": nft.id

    nft_owner = self.signer
    valid_bid = min_bid > 0

    current_time = self.validity_interval.last

    if nft_owner == nft.owner && valid_bid && current_time < auction_end_time {
      success
    } else {
      trace @"Error: Invalid auction parameters"
      fail
    }
  }
}
