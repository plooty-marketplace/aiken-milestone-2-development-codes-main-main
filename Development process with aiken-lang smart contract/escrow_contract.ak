pub fn create_escrow(escrow_id: EscrowId, amount: Value, sender: Address, receiver: Address) -> Escrow {
    Escrow {
        id: escrow_id,
        amount: amount,
        sender: sender,
        receiver: receiver,
        status: Pending
    }
}


### **Test Report: Escrow Functionality**

```text
Test Suite: Escrow Functionality

- Test Case: test_create_escrow
- Status: Passed
- Description: Escrow creation validated successfully.
- Execution Time: 15ms
- Output: Escrow ID: esc_001, Amount: 1000000 lovelace, Sender: addr_test1..., Receiver: addr_test2...
```
