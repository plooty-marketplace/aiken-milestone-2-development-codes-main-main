contract FixedMultiSigWallet {
    entrypoint approve(tx: Tx, signers: List<PubKey>, required_signatures: Int) -> Bool {
        let valid_signatures = signers.filter(|sig| tx.is_signed_by(sig))
        valid_signatures.length() >= required_signatures
    }
}
