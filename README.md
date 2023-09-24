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
Everywhere Interfaces are used instead of Contracts (which is Understandable!!)
1. V3Factory Deploys Pool using UniswapV3PoolDeployer 
2. UniswapV3PoolDeployer deploys new Pool by creating new Instance of the UniswapV3Pool and initiates parameters to later called inside the constructor of the Pool Smart Contract
3. Pool is Created