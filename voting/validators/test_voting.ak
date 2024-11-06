test VotingContractTest {
    let votes = Map::new()
    let result = VotingContract::vote(1, PubKey::from_hex("voter1"), None, votes)
    assert_eq!(VotingContract::pass(1, result, 10), False)
}

