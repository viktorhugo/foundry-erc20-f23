// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.30;

import { DeployETHCSCToken } from "../script/deploy-csc-token-eth.s.sol";
import { CSCToken } from "../src/CSCToken.sol";
import { StdCheats } from "forge-std/StdCheats.sol";
import { Test } from "forge-std/Test.sol";

interface MintableToken {
    function mint(address, uint256) external;
}

contract CSCTokenTest is Test {

    uint256 public constant STARTING_BALANCE = 100 ether;
    
    CSCToken public ourToken;
    DeployETHCSCToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    

    function setUp() external {
        deployer = new DeployETHCSCToken(); // el owner de nuestro token deberia ser el deployer
        ourToken = deployer.run();

        vm.prank(address(msg.sender)); // prank the deployer msg.sender
        ourToken.transfer(bob, STARTING_BALANCE);

        // vm.prank(address(msg.sender)); // prank the deployer msg.sender
        // ourToken.transfer(alice, STARTING_BALANCE);
    }

    // function testTransferBob() public view {
    //     assertEq(STARTING_BALANCE, ourToken.balanceOf(bob));
    // }

    // function testAllowancesWorks() public { // asiganciones de prueba
    //     // transferFrom ( se utliza para withdraw(retirar) wprkflow lo que permite a los contratos transferir un token en su nombre)
    //     uint256 initialAllowance = 1000;
    //     uint256 tranferAmount = 500;

    //     //  Bob approves Alice to spend tokens on her behalf
    //     // (Bob aprueba a Alice para que gaste fichas en su nombre)
    //     vm.prank(bob);
    //     ourToken.approve(alice, initialAllowance);

    //     // ahora ella va a quitarte los tokens a bob por que bob aprovo para hacerlo
    //     vm.prank(alice);
    //     ourToken.transferFrom(bob, alice, tranferAmount);

    //     assertEq(ourToken.balanceOf(alice), tranferAmount);
    //     assertEq(ourToken.balanceOf(bob), STARTING_BALANCE -tranferAmount);

    // }

    // function testInitialSupply() public {
    //     assertEq(ourToken.totalSupply(), deployer.INITIAL_SUPPLY());
    // }

    // function testUsersCantMint() public {
    //     vm.expectRevert();
    //     MintableToken(address(ourToken)).mint(address(this), 1);
    // }

    // function testAllowance() public {
    //     uint256 initialAllowance = 1000;
    //     ourToken.approve(bob, initialAllowance);
    //     assertEq(ourToken.allowance(address(this), bob), initialAllowance);
    // }

    // function testTransfer() public {
    //     uint256 transferAmount = 500;
    //     uint256 initialBalance = ourToken.balanceOf(address(this));
    //     // vm.prank(msg.sender);
    //     ourToken.transfer(bob, transferAmount);
    //     assertEq(ourToken.balanceOf(address(this)), initialBalance - transferAmount);
    //     assertEq(ourToken.balanceOf(bob), transferAmount);
    // }

    // function testTransferFrom() public {
    //     uint256 approveAmount = 1000;
    //     uint256 transferAmount = 500;

    //     ourToken.approve(bob, approveAmount);
    //     vm.prank(bob);
    //     ourToken.transferFrom(address(this), alice, transferAmount);

    //     assertEq(ourToken.allowance(address(this), bob), approveAmount - transferAmount);
    //     assertEq(ourToken.balanceOf(alice), transferAmount);
    //     assertEq(ourToken.balanceOf(address(this)), deployer.INITIAL_SUPPLY() - transferAmount);
    // }

    // function testTransferFromWithoutApproval() public {
    //     uint256 transferAmount = 500;
    //     vm.prank(bob);
    //     vm.expectRevert();
    //     ourToken.transferFrom(address(this), alice, transferAmount);
    // }

    // function testIncreaseAllowance() public {
    //     uint256 initialAllowance = 1000;
    //     uint256 increaseAmount = 500;
    //     ourToken.approve(bob, initialAllowance);
    //     ourToken.increaseAllowance(bob, increaseAmount);
    //     assertEq(ourToken.allowance(address(this), bob), initialAllowance + increaseAmount);
    // }

    // function testDecreaseAllowance() public {
    //     uint256 initialAllowance = 1000;
    //     uint256 decreaseAmount = 500;
    //     ourToken.approve(bob, initialAllowance);
    //     ourToken.decreaseAllowance(bob, decreaseAmount);
    //     assertEq(ourToken.allowance(address(this), bob), initialAllowance - decreaseAmount);
    // }

    // function testDecreaseAllowanceBelowZero() public {
    //     uint256 initialAllowance = 1000;
    //     uint256 decreaseAmount = 1500;
    //     ourToken.approve(bob, initialAllowance);
    //     vm.expectRevert();
    //     ourToken.decreaseAllowance(bob, decreaseAmount);
    // }

    // function testTransferToZeroAddress() public {
    //     uint256 transferAmount = 500;
    //     vm.expectRevert("ERC20: transfer to the zero address");
    //     ourToken.transfer(address(0), transferAmount);
    // }

    // function testApproveToZeroAddress() public {
    //     uint256 approveAmount = 500;
    //     vm.expectRevert("ERC20: approve to the zero address");
    //     ourToken.approve(address(0), approveAmount);
    // }

    // function testTransferFromExceedingBalance() public {
    //     uint256 approveAmount = 1000;
    //     uint256 transferAmount = deployer.INITIAL_SUPPLY() + 1;

    //     ourToken.approve(bob, approveAmount);
    //     vm.prank(bob);
    //     vm.expectRevert("ERC20: transfer amount exceeds balance");
    //     ourToken.transferFrom(address(this), alice, transferAmount);
    // }

    //* 1.Allowance :

    // testAllowance: Comprueba si approveestablece correctamente la asignación.
    
    //* 2. Transfers :

    // - testTransfer: Comprueba si transferlas actualizaciones equilibran correctamente.
    // - testTransferFrom: Comprueba si transferFromtransfiere correctamente los tokens cuando lo llama un gastador aprobado.
    // - testTransferFromWithoutApproval: Garantiza transferFromque falla cuando no hay aprobación.
    
    //* 3. Allowance Modification (Modificación de la asignación) :

    // - testIncreaseAllowance: Comprueba si increaseAllowanceaumenta correctamente la asignación.
    // - testDecreaseAllowance: Comprueba si decreaseAllowancedisminuye correctamente la asignación.
    // - testDecreaseAllowanceBelowZero: Garantiza decreaseAllowancela reversión si el resultado fuera negativo.
    
    //* 4. Invalid Operations (operaciones inválidas):

    // - testTransferToZeroAddress: Garantiza que se revierta la transferencia a la dirección cero.
    // - testApproveToZeroAddress: Garantiza la aprobación de las reversiones de dirección cero.
    // - testTransferFromExceedingBalance: Garantiza transferFromreversiones si el monto de la transferencia excede el saldo.
}