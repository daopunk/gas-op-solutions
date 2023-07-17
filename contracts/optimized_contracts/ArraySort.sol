// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedArraySort {
    function sortArray(uint256[] memory data) external pure returns (uint256[] memory) {
        unchecked {
            uint256 dataLen = data.length;
            uint256 dl = dataLen - 1;

            for (uint256 i = 0; i < dl; i++) {
                for (uint256 j = i + 1; j < dataLen; j++) {
                    uint256 di = data[i];
                    uint256 dj = data[j];

                    if (di > dj) {
                        uint256 temp = di;
                        data[i] = dj;
                        data[j] = temp;
                    }
                }
            }

            return data;
        }
    }
}
