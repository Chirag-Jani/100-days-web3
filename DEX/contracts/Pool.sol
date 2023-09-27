// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {IPoolDeployer} from "../interfaces/IPoolDeployer";
import {IPool} from "../interfaces/IPool.sol";

contract Pool is IPool {
    /**
     * @inheritdoc IPool
     */
    function poolAddress() external view returns (address) {
        return addres(this);
    }

    address public immutable factory;
    address public immutable token0;
    address public immutable token1;
    uint24 public immutable poolFees;

    constructor() public {
        (factory, token0, token1, poolFees) = IPoolDeployer(msg.sender).parameters();
    }
}
