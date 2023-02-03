// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Permit2} from "../../src/ERC20/Permit2.sol";
import {IAllowanceTransfer} from "../../src/ERC20/interfaces/IAllowanceTransfer.sol";
import {ISignatureTransfer} from "../../src/ERC20/interfaces/ISignatureTransfer.sol";
import {Allowance} from "../../src/ERC20/libraries/Allowance.sol";

abstract contract IMockPermit2 {
    // note that some parameters are unused in the erc20 and erc721 case but with this interface they can share some base tests

    function doStore(address from, address token, address spender, uint256 tokenId, uint256 word) public virtual {}

    function getStore(address from, address token, address spender, uint256 tokenId)
        public
        view
        virtual
        returns (uint256 word)
    {}

    function mockUpdateSome(
        address from,
        address token,
        address spender,
        uint160 updateData,
        uint256 tokenId,
        uint48 expiration
    ) public virtual {}

    function mockUpdateAll(
        address from,
        address token,
        address spender,
        uint160 updateData,
        uint256 tokenId,
        uint48 expiration,
        uint48 nonce
    ) public virtual {}

    function useUnorderedNonce(address from, uint256 nonce) public virtual {}
}
