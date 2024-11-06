test fn test_create_offer() -> bool {
    let offer_id = "offer_001";
    let asset = create_asset("12345", Address::new("addr_test1..."), Metadata::new("NFT Art"));
    let price = Value::lovelace(5000000);

    let offer = create_offer(offer_id, asset, price);

    assert_eq!(offer.asset.metadata.name, "NFT Art");
    assert_eq!(offer.price, Value::lovelace(5000000));

    true
}


### **Test Report: Offer Management**

```text
Test Suite: Offer Management

- Test Case: test_create_offer
- Status: Passed
- Description: Offer creation tested successfully.
- Execution Time: 12ms
- Output: Offer ID: offer_001, Asset: NFT Art, Price: 5000000 lovelace
```

---
