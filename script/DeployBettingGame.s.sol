// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {BettingGame} from "../src/BettingGame.sol";
import {HelperConfig} from "../";

contract DeployBettingGame is Script{
    function run() external returns(BettingGame){
        vm.startBroadcast();
        BettingGame bettingGame = new BettingGame();
        vm.stopBroadCast();

        return bettingGame;
    }
}