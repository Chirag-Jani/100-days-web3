// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {IPoolDeployer} from "../interfaces/IPoolDeployer.sol";
import {Pool} from "./Pool.sol";

/**
 * @title PoolDeployer
 * @author Chirag Jani
 * @dev implementation of IPoolDeployer interface
 */
contract PoolDeployer is IPoolDeployer {
    struct Parameters {
        address factory;
        address token0;
        address token1;
        uint256 fees;
    }

    /// @inheritdoc IPoolDeployer interface
    Parameters public override parameters;

    /**
     * @dev Deploys a pool with the given parameters by transiently setting the parameters storage slot and then clearing it after deploying the pool.
     * @param factory address of the factory contract
     * @param token0 first token address
     * @param token1 second token address
     * @param fees pool fees for each swap
     * @return poolAddress address of the newly created pool
     * @notice currently not utilizing the parameters variable and struct as doing basic implementation and deployment of the pool, once the pool contract implementation is started, parameters variable will be used inside its constructor
     */
    function deploy(address factory, address token0, address token1, uint256 fees)
        internal
        returns (address poolAddress)
    {
        parameters = Parameters({factory: factory, token0: token0, token1: token1, fees: fees});

        poolAddress = address(new Pool());

        delete parameters;
    }
}
