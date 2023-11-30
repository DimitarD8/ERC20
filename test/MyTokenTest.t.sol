// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployMyToken} from "../script/DeployMyToken.s.sol";
import {MyToken} from "../src/MyToken.sol";

contract MyTokenTest is Test{
    MyToken public myToken;
    DeployMyToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    
    uint256 public constant STARTING_BALACE = 100 ether;

    function setUp()public {
        deployer = new DeployMyToken();
        myToken = deployer.run();

        vm.prank(msg.sender);
        myToken.transfer(bob, STARTING_BALACE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALACE,myToken.balanceOf(bob));
    }
}