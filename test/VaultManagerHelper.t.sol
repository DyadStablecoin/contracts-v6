// SPDX-License-Identifier: MIT
pragma solidity =0.8.17;

import "forge-std/console.sol";
import {BaseTest} from "./BaseTest.sol";

contract VaultManagerTestHelper is BaseTest {
  address constant RANDOM_VAULT_1 = address(42);
  address constant RANDOM_VAULT_2 = address(314159);
  address constant RANDOM_VAULT_3 = address(69);

  function addVault(uint id, address vault) public {
    vm.prank(vaultLicenser.owner());
    vaultLicenser.add(vault);
    vaultManager. add(id, vault);
  }

  function deposit(uint id, address vault, uint amount) public {
    vaultManager.add(id, vault);
    weth.mint(address(this), amount);
    weth.approve(address(vaultManager), amount);
    vaultManager.deposit(id, address(vault), amount);
  }
}
