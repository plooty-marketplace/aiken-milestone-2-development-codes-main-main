 #[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_add_liquidity() {
        let token_a = Token { name: "TokenA".to_string(), amount: 1000 };
        let token_b = Token { name: "TokenB".to_string(), amount: 1000 };
        let mut pool = initialize_pool(token_a, token_b, 0.003);

        assert!(add_liquidity(&mut pool, 500, 500).is_ok());
        assert_eq!(pool.token_a.amount, 1500);
        assert_eq!(pool.token_b.amount, 1500);
    }

    #[test]
    fn test_swap_tokens() {
        let token_a = Token { name: "TokenA".to_string(), amount: 1000 };
        let token_b = Token { name: "TokenB".to_string(), amount: 2000 };
        let mut pool = initialize_pool(token_a, token_b, 0.003);
        let mut user_balance = UserBalance {
            user: Address::new("addr1..."),
            token_a_balance: 500,
            token_b_balance: 100,
        };
        let swap_request = SwapRequest {
            user: Address::new("addr1..."),
            token_a_amount: 100,
            token_b_amount: 0, // Ignored in this case
        };

        assert!(swap_tokens(&mut pool, &mut user_balance, swap_request).is_ok());
        assert_eq!(user_balance.token_a_balance, 400); // 100 Token A swapped
    }

    #[test]
    fn test_remove_liquidity() {
        let token_a = Token { name: "TokenA".to_string(), amount: 1000 };
        let token_b = Token { name: "TokenB".to_string(), amount: 1000 };
        let mut pool = initialize_pool(token_a, token_b, 0.003);

        assert!(remove_liquidity(&mut pool, 500, 500).is_ok());
        assert_eq!(pool.token_a.amount, 500);
        assert_eq!(pool.token_b.amount, 500);
    }
}
