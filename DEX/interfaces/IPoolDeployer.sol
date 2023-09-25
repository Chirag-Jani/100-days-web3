// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

/**
 * @title this is the interface of the contract that is able to deploy new liquidity pools
 * @author Chirag Jani
 * @notice
 *  @dev This is used to avoid having constructor arguments in the pool contract, which results in the init code hash of the pool being constant allowing the CREATE2 address of the pool to be cheaply computed on-chain (I don't understand this one yet)
 */
interface IPoolDeployer {
    /**
     * @notice values are written in the PoolDeployer while creating the pool in the deployer contract
     * @dev this function is called in the Pool contract constructor to fetch values of the pool
     * @return factory address of the factory (pool)
     * @return token0 address of the token0 or the first token after sort order
     * @return token1 address of the token1 or the second token after sort order
     * @return poolFees the fees collected on each swap on the pool
     */
    function parameters() external view returns (address factory, address token0, address token1, uint256 poolFees);
}
