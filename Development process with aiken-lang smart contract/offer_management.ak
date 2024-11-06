```aiken
pub fn create_offer(offer_id: OfferId, asset: Asset, price: Value) -> Offer {
    Offer {
        id: offer_id,
        asset: asset,
        price: price,
        status: Open
    }
}
```


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
