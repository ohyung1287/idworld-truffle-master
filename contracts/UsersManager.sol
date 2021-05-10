pragma solidity ^0.5.0;
// TODO
// only manager ethereum account have access of this contract
import './Zeppelin/ownership/Ownable.sol';

contract UsersManager is Ownable{
	struct User{
		address account; // user account address
		address contractUser; // "User" contract address
		bytes32 password; // User password hash value
	}
	event NewUser(address userAccount, address contractAccount, string username);
	mapping (string => User) private userToAccount; // a storage for user and their account, key=username
	mapping (string => address) private SINToAccount; // key = SIN, value = account address
	mapping (string => bool) private SINToCredit; // key = SIN, value = credit free
 
    function updateCredit(string memory _SIN, bool _credit) public onlyOwner{  
        SINToCredit[_SIN] = _credit;
    }
    function getCredit(string memory _SIN) public view returns(bool credit){
        return SINToCredit[_SIN];
    }
    function createSIN(string memory _SIN, address _user) public onlyOwner{//suppose happen once when user input SIN on first time  
        SINToAccount[_SIN] = _user;
    }
	function getUserBySIN(string memory _SIN)public view returns(address userContract){
		return SINToAccount[_SIN];
	}
	function changeSIN(string memory _prevSIN, string memory _newSIN) public{ // very rare situtation when user inputed a wrong SIN
		SINToAccount[_newSIN] = SINToAccount[_prevSIN];
		SINToAccount[_prevSIN]=address(0);
		SINToCredit[_newSIN] = SINToCredit[_prevSIN];
	}
	uint private count; // number of register User
	function checkValidateUsers(string memory _username) public view returns (address result){// see if input username already exist
		if(userToAccount[_username].account == address(0)){
			return userToAccount[_username].account;
		}else
			return userToAccount[_username].account;
		
	}
	function register(address _userAccount, address _userContract,
	string memory _username, string memory _password) public{
	    // Adding address and username to mapping, userCount++
		userToAccount[_username] = User(_userAccount, _userContract, keccak256(abi.encodePacked(_password)));
		count++;
		//To log user register event
		emit NewUser(_userAccount, _userContract, _username);
	}
	function login(string memory _username, string memory _password) public view 
	returns (address userAccount, address userContract){
		// if username & password is correct, return user address
		if(keccak256(abi.encodePacked(_password)) == userToAccount[_username].password)
	    	return (userToAccount[_username].account, userToAccount[_username].contractUser);
		else
			return (address(0),address(0));
	}
	
}