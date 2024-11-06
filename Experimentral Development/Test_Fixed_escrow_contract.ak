
test FixedEscrowContractTest {
    let mock_oracle = Oracle::new_mock(1200)  -- Mock oracle data
    let tx = Tx::new_with_sender(PubKey::from_hex("sender"))
    assert_eq!(FixedEscrowContract::release_funds(mock_oracle, tx, 1000), True)
}

