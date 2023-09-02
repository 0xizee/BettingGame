// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/** Function to implement
  1) first desgin the betting
   |-- 1) create a desgin that will take 
  2)After the game has ended give the winners their winning prize and 10 percent charge fees   
*/ 



contract BettingGame{

    /**********
     *Error **
     **********/

    error BettingGame__youMustRegister(address user);
    error BettingGame__timeEndedShouldBeMore();

    struct Bet {
        address[] playerParticipating;
        bool winned;
        uint256 started;
        uint256 timeEnded;
        bytes source;
        uint256 bettingPriceInusd;
    }

    address[] private s_registeredPlayer;
    mapping (address => Bet[]) private s_addressTobet;
    
    /**
     * @notice In order to start a bet user mustRegister to avoid spam 
     *         it must be in a way so that tobecomeRegsitered fees > than spamming 
     */

    // function to set bet

    function bet(address[] memory players , uint256 timeToBeEnded , bytes memory sourced , uint256 priceToSet , uint256 RegisteredIndexOFplayer , uint256 betIndex) external {
        if(msg.sender != s_registeredPlayer[RegisteredIndexOFplayer]){
            revert BettingGame__youMustRegister(msg.sender);
        }

        if(timeToBeEnded < block.timestamp + 100 seconds){
            revert BettingGame__timeEndedShouldBeMore();
        }

       address[] memory play = players;  
       Bet memory BET =  Bet({
        playerParticipating:play,
        winned:false,
        started:block.timestamp,
        timeEnded:timeToBeEnded,
        source:sourced,
        bettingPriceInusd:priceToSet
       });

        s_addressTobet[msg.sender][betIndex] = BET;

    }
    
}