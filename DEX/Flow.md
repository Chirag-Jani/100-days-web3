
// cretes pools using factory pattern
// first implement pool logic in the pool contract
// write a deployer contract same as uniswap deployer which will deploy the pool 

1. PoolFactory.sol -> Deploys different pools using PoolDeployer contract
2. PoolDeployer.sol -> Create a new Pool using Pool Contract
3. Pool.sol -> Contains logic of the pool 