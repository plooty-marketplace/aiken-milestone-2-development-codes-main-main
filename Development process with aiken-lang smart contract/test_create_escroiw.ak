test fn test_create_escrow() -> bool {
    let escrow_id = "esc_001";
    let amount = Value::lovelace(1000000);
    let sender = Address::new("addr_test1...");
    let receiver = Address::new("addr_test2...");

    let escrow = create_escrow(escrow_id, amount, sender, receiver);

    assert_eq!(escrow.sender, sender);
    assert_eq!(escrow.amount, Value::lovelace(1000000));

    true
}
