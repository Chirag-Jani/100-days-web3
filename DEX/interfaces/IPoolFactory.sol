// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

contract IPoolFactory {
    function owner() external view returns (address);
    function getPool(address token0, address token1, uint256 fees) external view returns (address pool);
    function createPool(address token0, address token1, uint256 fees) external returns (address pool);
}
