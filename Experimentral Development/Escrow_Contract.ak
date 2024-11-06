contract EscrowContract {
    entrypoint release_funds(oracle: Oracle, tx: Tx, threshold: Int) -> Bool {
        let price = oracle.get_latest_price()
        if price > threshold {
            tx.contains_output_to_address(tx.sender())  -- releases funds back to sender
        } else {
            False
        }
    }
}
