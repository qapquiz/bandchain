// SPDX-License-Identifier: Apache-2.0

pragma solidity 0.6.11;
pragma experimental ABIEncoderV2;

import {Obi} from "./Obi.sol";
import {ResultDecoder} from "./Result.sol";


contract ObiUser {
    using ResultDecoder for bytes;

    function decode(bytes memory _data)
        public
        pure
        returns (ResultDecoder.Result memory)
    {
        return _data.decodeResult();
    }
}
