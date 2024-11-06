contract FixedEscrowContract {
    fn get_latest_price(oracle: Oracle) -> Int {
        match oracle.fetch_price() {
            Some(price) => price,
            None => 0
        }
    }

    entrypoint release_funds(oracle: Oracle, tx: Tx, threshold: Int) -> Bool {
        let price = get_latest_price(oracle)
        if price > threshold {
            tx.contains_output_to_address(tx.sender())
        } else {
            False
        }
    }
}
