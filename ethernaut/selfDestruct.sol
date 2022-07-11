// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Force {}

contract Spray {
    Force _force;

    constructor(address payable _address) public {
        _force = Force(_address);
    }

    function deposit() public payable {}

    function showBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sprayIt(address payable _address) external {
        selfdestruct(_address);
    }
}

/*

Below is the original ethernaut contract.

selfdestruct(), can be used to destroy a contract and forcefully send funds to 
                the target address.

Security issues with contract: 

  - the contract has no code but this does not stop it from recieving funds.


Prevention:

  - address(this).balance == 0, should not be relied on for contract logic.
  - it is strongly advised to not use a contracts balance as a guard.

*/

// ORIGINAL ETHERNAUT CONTRACT

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// contract Force {/*

//                    MEOW ?
//          /\_/\   /
//     ____/ o o \
//   /~____  =ø= /
//  (______)__m_m)

// */}
