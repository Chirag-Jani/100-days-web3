# 100-days-web3

### Reentrancy
  - Different Types of Reentrancy Attacks
    - Classic Reentrancy
    - Cross Functional
    - Cross Contract
    - Read Only
  - Prevention?
    - Follow CEI patterns while writing functions
    - Checks: Require Statements
    - Effects: Update all the necessary variables
    - Interactions: External calls should me made at the end