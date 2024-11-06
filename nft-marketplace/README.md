# NFT Marketplace Smart Contract in Aiken-lang

Below is a basic example of an **NFT marketplace smart contract** in **Aiken-lang**. It implements features such as **listing**, **delisting**, **buying**, and **selling** of NFTs. This contract follows a simple design that can be extended with more features as needed (e.g., royalties, auction-style bidding, etc.).

---

### Features:
1. **Listing NFTs**: Allow NFT owners to list their tokens for sale with a specified price.
2. **Delisting NFTs**: Allow NFT owners to remove their listing.
3. **Buy/Sell NFTs**: Allow users to buy NFTs that are listed on the marketplace.

---

### Key Concepts:
- **NFT ID**: Represents a unique token ID for each NFT.
- **Owner Address**: Stores the address of the current owner of the NFT.
- **Price**: The price at which the NFT is listed.
- **Market Listings**: A map of listed NFTs, including owner and price.

---

# nft-marketplace

Write validators in the `validators` folder, and supporting functions in the `lib` folder using `.ak` as a file extension.

```aiken
validator my_first_validator {
  spend(_datum: Option<Data>, _redeemer: Data, _output_reference: Data, _context: Data) {
    True
  }
}
```

## Building

```sh
aiken build
```

## Configuring

**aiken.toml**
```toml
[config.default]
network_id = 41
```

Or, alternatively, write conditional environment modules under `env`.

## Testing

You can write tests in any module using the `test` keyword. For example:

```aiken
use config

test foo() {
  config.network_id + 1 == 42
}
```

To run all tests, simply do:

```sh
aiken check
```

To run only tests matching the string `foo`, do:

```sh
aiken check -m foo
```

## Documentation

If you're writing a library, you might want to generate an HTML documentation for it.

Use:

```sh
aiken docs
```

## Resources

Find more on the [Aiken's user manual](https://aiken-lang.org).
# ### Explanation of Code

1. **Listing NFTs**:
   - The `list_nft` function allows an NFT owner to list their NFT on the marketplace. The function takes the marketplace state, NFT ID, owner’s address, and price as inputs. It checks if the price is valid and then updates the marketplace with the new listing.

2. **Delisting NFTs**:
   - The `delist_nft` function allows the owner of a listed NFT to remove it from the marketplace. Only the owner of the NFT can delist it. The function takes the marketplace state, NFT ID, and the address of the requester as inputs.

3. **Buying NFTs**:
   - The `buy_nft` function allows a buyer to purchase an NFT from the marketplace. The function checks if the NFT is listed and if the offered price is sufficient. If successful, the ownership is transferred, and the seller’s address is returned to complete the transaction.

4. **Finalizing Sale**:
   - The `finalize_sale` function would handle the actual transfer of funds between the buyer and seller. In a real blockchain environment, this would involve interacting with Cardano's token standards and managing the exchange of native assets.

---

### Improvements and Additions

The marketplace contract provided is a simplified version that can be further enhanced with additional features such as:

1. **Royalties**: Add a system for automatically paying royalties to the original NFT creator on each resale.
2. **Auction Mechanism**: Implement time-bound auctions where users can place bids.
3. **Escrow Service**: Implement an escrow service to hold funds until the transaction is confirmed.
4. **Metadata Integration**: Store or link metadata (e.g., images, descriptions) with each NFT.
5. **Multi-Currency Support**: Allow the marketplace to accept payments in different tokens, including stablecoins or Cardano's native tokens.

---

### Proof of Security

1. **Owner Validation**: The `delist_nft` and `buy_nft` functions ensure that only the owner of the NFT can delist it, and only a valid buyer offering a sufficient price can purchase it.
2. **Safe Price Handling**: The contract checks that the price is greater than zero and ensures the offered price is at least equal to the listing price before proceeding with a purchase.
3. **Transaction Finalization**: The `finalize_sale` function can be extended to ensure that the transaction is atomic—either both the ownership transfer and payment occur, or neither does.

In a real deployment, the contract would need integration with Cardano's token standards (e.g., **CIP-20** for fungible tokens) and testing on testnets like **Plutus Playground** or the **Cardano Testnet**.

---

This basic **NFT Marketplace Smart Contract** in Aiken-lang can serve as a foundation for more complex and secure marketplace implementations on the Cardano blockchain.




- **Old Feature**: Simple asset exploration and filtering.
- **New Feature**: Enhanced filtering with the **`policy_id`** to retrieve all NFTs belonging to a particular policy.

#### Potential Bugs:
- **Empty collection**: No NFTs found under the provided policy ID.
- **Solution**: Implement a check to ensure the filtered collection isn't empty before proceeding.

---

### New Features in Aiken-lang:

- **Trace functionality**: Provides detailed logging and debugging support during smart contract execution.
- **Enhanced transaction handling**: Advanced handling of **transaction intervals**, including time-based auction mechanisms and bid validations.
- **Fuzz testing**: Aiken-lang’s `fuzz` module can be used to test smart contracts with randomized inputs, improving reliability and coverage.

### Old Features in Aiken-lang:

- **Pattern matching**: Aiken-lang’s pattern matching feature is used in transaction handling and validator functions.
- **Basic list utilities**: Functions like `list.filter` and `list.map` are used for data manipulation, particularly in asset filtering.
- **Standard validation**: Functions validating ownership and basic integer operations for conditions (e.g., bid amount, staking time).

---

### Bugs, Errors, and Solutions:

#### 1. **Incorrect NFT Ownership Validation**
   - **Bug**: If the contract fails to verify the signer as the NFT owner, unauthorized users may perform actions like delisting or auctioning.
   - **Solution**: Use `Transaction.signer` to validate ownership in every operation, ensuring only the rightful owner can execute actions.


#### 2. **Invalid Auction Timing**
   - **Bug**: Bids could be placed after the auction ends, or auctions could start with an invalid end time.
   - **Solution**: Implement time checks using `self.validity_interval.last` to ensure bids are only accepted within the auction period.

#### 3. **Staking Time Validation**
   - **Bug**: A user might attempt to stake an NFT for zero or negative time, leading to unintended behavior.
   - **Solution**: Ensure that staking time is validated (`staking_time > 0`) before accepting the transaction.

#### 4. **Empty NFT Collections for Policy IDs**
   - **Bug**: If no NFTs are found for a given policy ID, the marketplace could fail without providing feedback.
   - **Solution**: Ensure proper feedback using `trace` and fail the transaction when no NFTs are found, so the user is aware of the issue.
