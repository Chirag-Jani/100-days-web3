// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

interface IPool {
    /**
     * @return address address of the pool contract
     */
    function poolAddress() external view returns (address);
}
