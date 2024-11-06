contract FixedVotingContract {
    entrypoint vote(proposal_id: Int, voter: PubKey, delegation: Option<PubKey>, votes: Map<PubKey, Int>) -> Map<PubKey, Int> {
        let counted_vote = match delegation {
            Some(delegate) => votes.put(delegate, votes.get(delegate).unwrap_or(0) + 1),
            None => votes.put(voter, votes.get(voter).unwrap_or(0) + 1)
        }
        counted_vote
    }

    entrypoint pass(proposal_id: Int, votes: Map<PubKey, Int>, threshold: Int) -> Bool {
        votes.values().sum() > threshold
    }
}
