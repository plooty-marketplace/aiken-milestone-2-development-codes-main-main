// Buy an NFT
fn buy_nft(marketplace: MarketplaceState, nft_id: NFTID, buyer: Address, offered_price: Int) -> Result<(MarketplaceState, String), String> {
    match Map.get(nft_id, marketplace) {
        None => Err("NFT not listed for sale"),
        Some(listing) =>
            if offered_price < listing.price {
                Err("Offered price is too low")
            } else {
                // Transfer ownership
                let updated_marketplace = Map.remove(nft_id, marketplace)
                Ok((updated_marketplace, listing.owner)) // Return the marketplace state and the seller's address
            }
    }
}

// Sell an NFT: finalize sale by transferring funds
fn finalize_sale(seller: Address, buyer: Address, price: Int) -> Result<String, String> {
    // Logic to transfer funds from buyer to seller
    Ok("Sale completed successfully")
}

// Unit tests for marketplace features
test "List an NFT" {
    let marketplace = init_marketplace()
    let updated_marketplace = list_nft(marketplace, "nft1", "addr1", 100)
    assert_eq(Map.get("nft1", updated_marketplace), Some({owner: "addr1", price: 100}))
}

test "Delist an NFT" {
    let marketplace = init_marketplace()
    let marketplace = list_nft(marketplace, "nft1", "addr1", 100)
    let updated_marketplace = delist_nft(marketplace, "nft1", "addr1")
    assert_eq(Map.get("nft1", updated_marketplace), None)
}

test "Buy an NFT" {
    let marketplace = init_marketplace()
    let marketplace = list_nft(marketplace, "nft1", "addr1", 100)
    let (updated_marketplace, seller) = buy_nft(marketplace, "nft1", "addr2", 100)
    assert_eq(seller, "addr1")
    assert_eq(Map.get("nft1", updated_marketplace), None)
}
