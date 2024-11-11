//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "../tokens/ERC20MinterPauserPermitUpgradeable.sol";

/**
 * @notice RandomToken token contract
 */
contract RandomToken is ERC20MinterPauserPermitUpgradeable {
    /**
     * @notice Intializer
     * @param _DAO the address of the owner
     */
    function initialize2(address _DAO) public initializer {
        super.initialize("ToToro Test Token", "TTT2");
        _grantRole(DEFAULT_ADMIN_ROLE, _DAO);
    }

    
}