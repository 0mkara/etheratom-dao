pragma solidity ^0.4.25;
//import "https://github.com/0mkara/aragonOS/contracts/apps/AragonApp.sol";
import "/home/0mkar/Karma/aragonOS/contracts/apps/AragonApp.sol";
import "./ETMToken.sol";


contract ETMDao is AragonApp {
    EtheratomToken token;
    bytes32 public constant IS_SELLER = keccak256("IS_SELLER");
    /*
    * @dev As an AragonApp it needs to be initialized in order for roles (`auth` and `authP`) to work
    */
    function initialize() external onlyInit {
        initialized();
        // token = new EtheratomToken();
    }

    /*
    * @dev transferForCash function is used to transfer Token to a supporter
    */
    function transferForCash(address _to, uint256 value) public {
        token.transfer(_to, value);
    }

    function addToken(address _tokenaddr) public {
        token = EtheratomToken(_tokenaddr);
    }
    function balanceOf(address _owner) public view returns (uint256) {
        return token.balanceOf(_owner);
    }
}
