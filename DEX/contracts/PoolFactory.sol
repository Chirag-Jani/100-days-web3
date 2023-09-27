// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {IPoolFactory} from "../interfaces/IPoolFactory.sol";

import {PoolDeployer} from "./PoolDeployer.sol";

import {Pool} from "./Pool.sol";

/// @notice deploys Pool contracts and manages ownership and control over pool contract fees (not sure what it is)
contract PoolFactory is IPoolFactory, PoolDeployer {
    /// @inheritdoc IPoolFactory
    address public override owner;

    /// @inheritdoc IPoolFactory
    mapping(address => mapping(address => address)) public override getPool;

    constructor() {
        owner = msg.sender;
    }

    /// @inheritdoc IPoolFactory
    function createPool(address tokenA, address tokenB, uint24 fees) external override returns (address pool) {
        require(tokenA != tokenB);

        // setting token0 and token1
        (address token0, token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);

        require(token0 != address(0));
        require(getPool[token0][token1][fees] == address(0), "Pool Exists");

        pool = deploy(address(this), token0, token1, fees);

        getPool[token0][token1][fee] = pool;
        // populate mapping in the reverse direction, deliberate choice to avoid the cost of comparing addresses
        getPool[token1][token0][fee] = pool;
    }
}
