pub fn create_offer(offer_id: OfferId, asset: Asset, price: Value) -> Offer {
    Offer {
        id: offer_id,
        asset: asset,
        price: price,
        status: Open
    }
}

### **Test Report: Asset Management**

```text
Test Suite: Asset Management

- Test Case: test_create_asset
- Status: Passed
- Description: Asset creation verified successfully.
- Execution Time: 10ms
- Output: Asset ID: 12345, Owner: addr_test1..., Metadata: NFT Art
```
