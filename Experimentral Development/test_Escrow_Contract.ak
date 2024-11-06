test EscrowContractTest {
    let oracle = Oracle::new("https://price-feed.oracle/cardano")
    let tx = Tx::new_with_sender(PubKey::from_hex("sender"))
    assert_eq!(EscrowContract::release_funds(oracle, tx, 1000), True)
}
