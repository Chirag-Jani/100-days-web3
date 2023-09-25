// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {IPool} from "../interfaces/IPool.sol";

contract Pool is IPool {
    /**
     * @inheritdoc IPool
     */
    function poolAddress() external view returns (address) {
        return addres(this);
    }
}
