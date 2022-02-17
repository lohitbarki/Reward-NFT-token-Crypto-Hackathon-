// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTContract is ERC721 {
	uint totalTokens = 5;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("RewardNFT", "RNFT") {
	}

    function _baseURI() internal pure override returns (string memory) {
        return "https://my-json-server.typicode.com/lohitbarki/demo/tokens/";
    }

    function mint(address to)
        public returns (uint256)
    {
        require(_tokenIdCounter.current() < totalTokens); 
        _tokenIdCounter.increment();
        _safeMint(to, _tokenIdCounter.current());

        return _tokenIdCounter.current();
    }
}
