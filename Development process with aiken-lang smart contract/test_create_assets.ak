test fn test_create_asset() -> bool {
    let asset_id = "12345";
    let owner = Address::new("addr_test1...");
    let metadata = Metadata::new("NFT Art");

    let asset = create_asset(asset_id, owner, metadata);

    assert_eq!(asset.owner, owner);
    assert_eq!(asset.metadata.name, "NFT Art");

    true
}
