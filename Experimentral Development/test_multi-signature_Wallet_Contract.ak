test MultiSigWalletTest {
    let tx = Tx::new_signed_by(PubKey::from_hex("abc"))
    let signers = [PubKey::from_hex("abc"), PubKey::from_hex("def"), PubKey::from_hex("ghi")]
    assert_eq!(MultiSigWallet::approve(tx, signers, 2), True)
}
