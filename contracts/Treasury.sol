// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "openzeppelin-contracts/contracts/access/Ownable.sol";

/*
  By default, the owner of an Ownable contract is the account that deployed it.
*/
contract Treasury is Ownable {

    //This is a boolean variable that will be used to pause the contract.
    bool public pause;

    // Function to deposit Ether into the contract
    function deposit() external payable {
        require(
            msg.value > 0,
            "Treasury: Deposit amount should be greater than zero"
        );


        // The balance of the contract is automatically updated
    }

    // Function to withdraw Ether from the contract to specified address
    function withdraw(uint256 amount, address receiver) external onlyOwner {
        require(pause == false, "Treasury: Contract is paused");
        require(
            address(receiver) != address(0),
            "Treasury: receiver is zero address"
        );
        require(pause == false, "Treasury: Contract is paused");
        require(
            address(this).balance >= amount,
            "Treasury: Not enough balance to withdraw"
        );


        (bool send, ) = receiver.call{value: amount}("");
        require(send, "To receiver: Failed to send Ether");
    }

    // Function to allow the owner to withdraw the entire balance
    function withdrawAll() external onlyOwner {
        uint256 balance = address(this).balance;
        require(pause == false, "Treasury: Contract is paused");
        require(
            balance > 0, "Treasury: No balance to withdraw"
        );


        (bool send, ) = msg.sender.call{value: balance}("");
        require(pause == false, "Treasury: Contract is paused");
        require(
            send, "To owner: Failed to send Ether"
        );
    }


    // Function to get the contract balance
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    //The next set of functions are to implement a pause function for the contract
    //This is to prevent full visibility of the contract to the public and only
    //allows certain functions to be called at a time

    // Function to pause the contract
    function pauseContract() external onlyOwner {
        pause = true;
    }

    // Function to unpause the contract
    function unpauseContract() external onlyOwner {
        pause = false;
    }

    // Function to get the pause status of the contract
    function getPauseStatus() external view returns (bool) {
        return pause;
    }

    //This function create an escrow service which would get rid of the need 
    //for potentially malicious, 3rd party services.
    struct Escrow {
        address payable payer;
        address payable payee;
        uint256 amount;
        bool released;
    }

    Escrow[] public escrows;
    function createEscrow(address payable payeee) external payable {
        require(payeee != address(0), "Treasury: Payee is zero address");
        require(msg.value > 0, "Treasury: Amount should be greater than zero");

        Escrow memory newEscrow = Escrow({
            payer: payable(msg.sender),
            payee: payeee,
            amount: msg.value,
            released: false 
        });
        escrows.push(newEscrow);
    }
    function releaseEscrow(uint256 index) external onlyOwner {
        require(index < escrows.length, "Treasury: Invalid");

        Escrow storage escrow = escrows[index];

        require(!escrow.released, "Treasury: Escrow already released");

        (bool send, ) = escrow.payee.call{value: escrow.amount}("");

        require(send, "To payee: Failed to send Ether");

        escrow.released = true; 
    }
}
