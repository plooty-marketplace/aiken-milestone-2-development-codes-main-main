contract DexSwap {
    var liquidity: Map<Token, Int> = Map.empty()
    var tokenA: Token
    var tokenB: Token

    // Swap function with slippage protection
    public fun swapWithSlippage(amountIn: Int, maxSlippage: Float, fromToken: Token) {
        let toToken = if fromToken == tokenA { tokenB } else { tokenA }

        // Calculate expected output
        let expectedAmountOut = calculateAmountOut(amountIn, liquidity[fromToken], liquidity[toToken])
        
        // Calculate the minimum acceptable amount after slippage
        let slippageTolerance = expectedAmountOut * maxSlippage
        let minimumAmountOut = expectedAmountOut - slippageTolerance

        // Perform the swap only if the slippage is within the acceptable range
        let actualAmountOut = calculateAmountOut(amountIn, liquidity[fromToken], liquidity[toToken])
        require(actualAmountOut >= minimumAmountOut, "Slippage tolerance exceeded")

        // Update liquidity and perform the token transfer
        liquidity[fromToken] -= amountIn
        liquidity[toToken] += actualAmountOut

        transferTokensTo(msg.sender, toToken, actualAmountOut)
    }

    // Calculation for output amount
    private fun calculateAmountOut(amountIn: Int, reserveIn: Int, reserveOut: Int): Int {
        // Example AMM formula, this can be expanded based on your DEX design
        return (amountIn * reserveOut) / (reserveIn + amountIn)
    }
