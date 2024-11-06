```aiken
// Define types for NFT marketplace
type Address = String
type NFTID = String
type Int = i64

// Structure for market listings
type Listing = {
    owner: Address,
    price: Int
}

// Market state: a map of NFT listings
type MarketplaceState = Map<NFTID, Listing>

// Initialize the marketplace state
fn init_marketplace() -> MarketplaceState {
    Map.empty()
}

// List an NFT for sale
fn list_nft(marketplace: MarketplaceState, nft_id: NFTID, owner: Address, price: Int) -> Result<MarketplaceState, String> {
    if price <= 0 {
        Err("Price must be greater than 0")
    } else {
        let new_listing = {owner: owner, price: price}
        let updated_marketplace = Map.insert(nft_id, new_listing, marketplace)
        Ok(updated_marketplace)
    }
}

// Delist an NFT (remove it from the marketplace)
fn delist_nft(marketplace: MarketplaceState, nft_id: NFTID, requester: Address) -> Result<MarketplaceState, String> {
    match Map.get(nft_id, marketplace) {
        None => Err("NFT not listed"),
        Some(listing) =>
            if listing.owner != requester {
                Err("Only the owner can delist the NFT")
            } else {
                let updated_marketplace = Map.remove(nft_id, marketplace)
                Ok(updated_marketplace)
            }
    }
}
