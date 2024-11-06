validator bid_nft {
  fn(bid_amount: Int, nft: Asset, auction_end_time: Int, self: Transaction) {
    trace @"Bidding on NFT:": nft.id

    valid_bid = bid_amount > nft.current_bid

    current_time = self.validity_interval.last

    if valid_bid && current_time < auction_end_time {
      success
    } else {
      trace @"Error: Invalid bid or auction expired"
      fail
    }
  }
}
