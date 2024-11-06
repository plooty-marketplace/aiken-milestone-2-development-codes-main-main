test FixedVotingContractTest {
    let votes = Map::new()
    let result = FixedVotingContract::vote(1, PubKey::from_hex("voter1"), None, votes)
    assert_eq!(FixedVotingContract::pass(1, result, 10), False)
}

