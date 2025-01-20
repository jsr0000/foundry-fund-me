// SPDX-License-Identifier: MIT

// fund
//withdraw

pragma solidity ^0.8.18;

import {Script} from "lib/forge-std/src/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "src/FundMe.sol";

contract fundFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function FundFundMe(address mostRecentDeployed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployed)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(FundMe, block.chainid);
        fundFundMe(mostRecentDeployed);
    }
}
