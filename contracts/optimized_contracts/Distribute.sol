// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedDistribute {
    address immutable contr1;
    address immutable contr2;
    address immutable contr3;
    address immutable contr4;

    uint256 immutable createTime;

    uint256 immutable amount;

    constructor(address[4] memory _contributors) payable {
        createTime = block.timestamp + 1 weeks;
        contr1 = _contributors[0];
        contr2 = _contributors[1];
        contr3 = _contributors[2];
        contr4 = _contributors[3];
        amount = msg.value >> 2;
    }

    function distribute() external {
        require(block.timestamp > createTime, "cannot distribute yet");

        payable(contr1).call{value: amount}("");
        payable(contr2).call{value: amount}("");
        payable(contr3).call{value: amount}("");
        payable(contr4).call{value: amount}("");
    }
}
