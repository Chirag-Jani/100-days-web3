# 100-days-web3

## Day 1
### Reentrancy
  - Different Types of Reentrancy Attacks
    - Classic Reentrancy
    - Cross Functional
    - Cross Contract
    - Read Only
  - Prevention?
    - Use nonReentrant modifier
    - Follow CEI patterns while writing functions
    - Checks: Require Statements
    - Effects: Update all the necessary variables
    - Interactions: External calls should me made at the end

## Day 2
### Uniswap V3 Smart Contracts
  - Went through Uniswap smart contracts
  - Learnt about Liquidity pool and Factory pattern for the Pool creation
  - Reviewed,
    - Interfaces
    - UniswapV3Factory
    - UniswapV3Pool
    - UniswapV3PoolDeployer
    - IUniswapV3PoolState
  
  ### Uniswap Contract Flow:  
  Everywhere Interfaces are used instead of Contracts 
  (which is Understandable!!)
  1. V3Factory Deploys Pool using UniswapV3PoolDeployer 
  2. UniswapV3PoolDeployer deploys new Pool by creating new Instance of the UniswapV3Pool and initiates parameters to later called inside the constructor of the Pool Smart Contract
  3. Pool is Created


## Day 3
- Live auditing process video
  - how to optimize gas in for-loops (cache the comparision in one variable, instead of checking each time)
  - Avoid Reentrancy using CEI pattern (most common) 
  - Wrap all the functions and get the high level overview of what they are doing instead of getting overwhelmed by the codebase
  - break down smart contract in terms of features (not functions)
### Uniswap Contract cont.
  - Ticks are used for Range bound liquidity
    - Ticks are sort of the upper and lower limits in between which the liquidity provider wants the trades to occur
    - It helps to minimize the impermanent loss that was the issue in uniswap-v2

- Trying to create a basic DEX by taking reference from Uniswap Smart Contract
  - ticks and other complex features of Uniswap are not included yet


## Day 4
- Learnt more about EVM and how it stores data
  - Stack
  - Memory
  - Calldata
  - Storage
  - Logs
  - Code
  - Opecodes
  - Calling function with lower signature value is gas efficient because at opcode level, it gets stored in the ascending order of the value of the function signature
  - EVM Process [here]([https://](https://www.evm.codes/))

### Uniswap Ticks and Range Bound Liquidity
- Tick represents the price range where the token can be traded with another token
- In V2, LPers needed to provide Liqui. in the whole range (x * y = k)
  - Impermanent loss was there due to this
- There are two things to consider, one is Ticks and other is sqrtPriceX96
  - Ticks are the lower and upper limits
  - whereas, sqrtPriceX96 is the actual price at which trading/swapping is taking place 
    - this is generally between two ticks

## Day 5
- DEX smart contract dev. cont.
- Created Factory contract without Ticks (reference of uniswap contracts)
- Learning Uniswap Pool Contract in depth using [Smart Contract Programmer](https://youtube.com/playlist?list=PLO5VPQH6OWdXp2_Nk8U7V-zh7suI05i0E&si=QWPwzWgV22DaBuQ6) Uniswap V3 playlist

## Day 6
- How minting works in Uniswap
- Implementing the mint function 

## Day 7
- [Sandwich Attacks](https://youtu.be/6y3nwJS4UJw?si=Sy09pcAKtWOVCXnr)
  - These are special type of Frontrunning attacks
  - Happens while swapping
  - Price SLippage can affect our swaps 
  - attacker can take advantage of slippage by frontrunning our swap transaction
  - can keep the check on slippage amount while swapping called SLIPPAGE TOLERANCE

## Day 8
- Trip

## Day 9
- Understanding GMX V2 protocol
- Uniswap cont.