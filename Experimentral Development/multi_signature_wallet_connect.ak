Multi-signature_Wallet_Contract.ak


contract MultiSigWallet {
    entrypoint approve(tx: Tx, signers: List<PubKey>, required_signatures: Int) -> Bool {
        let valid_signatures = signers.filter(|sig| tx.is_signed_by(sig))
        valid_signatures.length() >= required_signatures
    }
}


test_multi-signature_Wallet_Contract.ak


test MultiSigWalletTest {
    let tx = Tx::new_signed_by(PubKey::from_hex("abc"))
    let signers = [PubKey::from_hex("abc"), PubKey::from_hex("def"), PubKey::from_hex("ghi")]
    assert_eq!(MultiSigWallet::approve(tx, signers, 2), True)
}


Fixed_Multi-signature_Wallet_Contract.ak

contract FixedMultiSigWallet {
    entrypoint approve(tx: Tx, signers: List<PubKey>, required_signatures: Int) -> Bool {
        let valid_signatures = signers.filter(|sig| tx.is_signed_by(sig))
        valid_signatures.length() >= required_signatures
    }
}
