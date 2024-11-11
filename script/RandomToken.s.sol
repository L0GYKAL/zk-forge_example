// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {RandomToken} from "../src/RandomToken/RandomToken.sol";

contract RandomTokenScript is Script {
    address ADMIN_ADDRESS;
    address PROXY;

    function setUp() public {
        ADMIN_ADDRESS = vm.envAddress("ADMIN_ADDRESS");
    }

    function run() public {
        vm.startBroadcast();
        address RandomTokenImplementation = address(new RandomToken());
        PROXY = address(new ERC1967Proxy(RandomTokenImplementation, abi.encodeCall(RandomToken.initialize2, (ADMIN_ADDRESS))));
        console2.log("Token address is: ");
        console2.log(PROXY);
        vm.stopBroadcast();
    }
}