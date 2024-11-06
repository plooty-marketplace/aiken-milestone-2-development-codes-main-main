test fn test_calculate_fee() -> bool {
    let transaction_amount = Value::lovelace(10000000);
    let fee_percentage = 2;

    let fee = calculate_fee(transaction_amount, fee_percentage);

    assert_eq!(fee, Value::lovelace(200000));

    true
}
