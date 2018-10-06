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
    function initialize() public onlyInit {
        initialized();
    }

    /*
    * @dev transferForCash is used to transfer Token to a supporter from the DAO contract
    */
    function transferForCash(address _to, uint256 value) external isInitialized {
        token.transfer(_to, value);
    }

    /*
    * @dev addToken is used to add a Token by address to DAO
    */
    function addToken(address _tokenaddr) public {
        token = EtheratomToken(_tokenaddr);
    }

    /*
    * @dev balanceOf is proxy for Token's balanceOf function
    */
    function balanceOf(address _owner) public view returns (uint256) {
        return token.balanceOf(_owner);
    }
}
