
```rust
// Make an offer
pub fn make_offer(buyer: Address, item_id: u64, price: u64) -> Offer {
    Offer {
        buyer,
        item_id,
        price,
        is_accepted: false,
    }
}

// Accept an offer
pub fn accept_offer(offer: &mut Offer) -> Result<(), String> {
    if offer.is_accepted {
        return Err("Offer already accepted.".to_string());
    }
    offer.is_accepted = true;
    Ok(())
}

// Unit Test for offers
#[test]
fn test_accept_offer() {
    let buyer = Address::new("addr1...");
    let mut offer = make_offer(buyer.clone(), 1, 500);

    assert!(accept_offer(&mut offer).is_ok());
    assert!(accept_offer(&mut offer).is_err());
}
```

#### 4.5 **Item Listing**
Allow sellers to list items for sale.

```rust
// List an item for sale
pub fn list_item(id: u64, name: String, seller: Address, price: u64) -> Item {
    Item { id, name, seller, price }
}

// Unit Test for item listing
#[test]
fn test_list_item() {
    let seller = Address::new("addr2...");
    let item = list_item(1, "MyItem".to_string(), seller.clone(), 300);
    assert_eq!(item.name, "MyItem");
    assert_eq!(item.price, 300);
}
```

#### 4.6 **User Verification**
Include a function to verify users.

```rust
// Verify a user
pub fn verify_user(user: &mut User) {
    user.is_verified = true;
}

// Unit Test for user verification
#[test]
fn test_verify_user() {
    let mut user = User {
        address: Address::new("addr3..."),
        is_verified: false,
    };
    verify_user(&mut user);
    assert!(user.is_verified);
}
```

### 5. **Error Handling**
Ensure the contract handles errors gracefully.

```rust
pub enum ContractError {
    EscrowAlreadyCompleted,
    OfferAlreadyAccepted,
    UserNotVerified,
}

// Implement Display for ContractError
impl std::fmt::Display for ContractError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            ContractError::EscrowAlreadyCompleted => write!(f, "Escrow has already been completed."),
            ContractError::OfferAlreadyAccepted => write!(f, "Offer has already been accepted."),
            ContractError::UserNotVerified => write!(f, "User is not verified."),
        }
    }
}
```
