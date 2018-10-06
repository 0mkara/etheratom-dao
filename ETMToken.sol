pragma solidity ^0.4.24;
import "https://github.com/OpenZeppelin/zeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/zeppelin-solidity/contracts/math/SafeMath.sol";

contract EtheratomToken is ERC20 {
    using SafeMath for uint256;
    string public constant name = "EtheratomToken";
    string public constant symbol = "ETM";
    uint8 public constant decimals = 18;

    uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals));

    /**
    * @dev Constructor that gives msg.sender all of existing tokens.
    */
    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}
