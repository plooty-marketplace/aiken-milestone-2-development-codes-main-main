pub fn create_asset(asset_id: AssetId, owner: Address, metadata: Metadata) -> Asset {
    Asset {
        id: asset_id,
        owner: owner,
        metadata: metadata,
        status: Active
    }
}