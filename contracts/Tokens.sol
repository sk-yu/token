pragma solidity 0.4.24;
import "../node_modules/zeppelin-solidity/contracts/token/ERC20/PausableToken.sol";
import "./LockableToken.sol";


contract Tokens is LockableToken  {

    string internal constant ALREADY_LOCKED = "Tokens already locked";
    string internal constant NOT_LOCKED = "No tokens locked";
    string internal constant AMOUNT_ZERO = "Amount can not be 0";
    string internal constant NOT_ENOUGH_TOKENS = "Not enough tokens";
    string internal constant INVALID_TOKEN_VALUES = "Invalid token values";
    
    string public name = "TestToken"; 
    string public symbol = "TT00";
    uint public decimals = 8;
    uint256 public initialSupply = 15000 * (10**uint256(decimals));

    constructor() public {
        balances[msg.sender] = initialSupply;
        totalSupply_ = initialSupply;
    }

    event Mint(address minter, uint256 value);
    event Burn(address burner, uint256 value);

    function mint(address _to, uint256 _amount) public onlyOwner {
        require(_amount > 0, INVALID_TOKEN_VALUES);
        balances[_to] = balances[_to].add(_amount);
        totalSupply_ = totalSupply_.add(_amount);
        emit Mint(_to, _amount);
    }

    function burn(address _of, uint256 _amount) public onlyOwner {
        require(_amount > 0, NOT_ENOUGH_TOKENS);
        require(_amount <= balances[_of], NOT_ENOUGH_TOKENS);

        balances[_of] = balances[_of].sub(_amount);
        totalSupply_ = totalSupply_.sub(_amount);
        emit Burn(_of, _amount);
    }

}