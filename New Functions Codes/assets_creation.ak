```rust
// Function to create a new token
pub fn create_token(owner: Address, name: String, amount: u64) -> Token {
    Token { owner, name, amount }
}

// Unit Test for token creation
#[test]
fn test_create_token() {
    let owner = Address::new("addr1...");
    let name = "MyToken".to_string();
    let amount = 100;

    let token = create_token(owner.clone(), name.clone(), amount);
    assert_eq!(token.name, "MyToken");
    assert_eq!(token.amount, 100);
}
```

#### 4.3 **Escrow Management**
Manage escrows with enhanced functionality.

```rust
// Create an escrow
pub fn create_escrow(buyer: Address, seller: Address, amount: u64) -> Escrow {
    Escrow {
        buyer,
        seller,
        amount,
        is_completed: false,
    }
}

// Complete an escrow
pub fn complete_escrow(escrow: &mut Escrow) -> Result<(), String> {
    if escrow.is_completed {
        return Err("Escrow already completed.".to_string());
    }
    escrow.is_completed = true;
    Ok(())
}

// Unit Test for escrow management
#[test]
fn test_complete_escrow() {
    let buyer = Address::new("addr1...");
    let seller = Address::new("addr2...");
    let mut escrow = create_escrow(buyer.clone(), seller.clone(), 200);

    assert!(complete_escrow(&mut escrow).is_ok());
    assert!(complete_escrow(&mut escrow).is_err());
}
```
