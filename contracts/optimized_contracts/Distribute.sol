// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedDistribute {
    address[4] public contributors;
    uint256 public createTime;

    constructor(address[4] memory _contributors) payable {
        contributors = _contributors;
        createTime = block.timestamp + 1 weeks;
    }

    function distribute() external {
        require(block.timestamp > createTime, "cannot distribute yet");

        uint256 amount = address(this).balance >> 2;

        payable(contributors[0]).call{value: amount}("");
        payable(contributors[1]).call{value: amount}("");
        payable(contributors[2]).call{value: amount}("");
        payable(contributors[3]).call{value: amount}("");
    }
}
