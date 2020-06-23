pragma solidity 0.5.14;
pragma experimental ABIEncoderV2;
import {IBridge} from "../Bridge.sol";
import {IBridgeCache} from "../IBridgeCache.sol";

contract BridgeCacheConsumerMock {
    IBridge.RequestPacket public requestTemplate;
    IBridge.ResponsePacket public latestRes;
    IBridgeCache public bridgeCache;

    constructor(
        IBridgeCache _bridgeCache,
        IBridge.RequestPacket memory _initialTemplate
    ) public {
        bridgeCache = _bridgeCache;
        setRequestTemplete(_initialTemplate);
    }

    function setRequestTemplete(IBridge.RequestPacket memory _newTemplate)
        public
    {
        requestTemplate = _newTemplate;
    }

    function consumeCache() public {
        latestRes = bridgeCache.getLatestResponse(requestTemplate);
    }
}
