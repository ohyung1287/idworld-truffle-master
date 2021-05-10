pragma solidity ^0.5.0;
// TODO
// only manager ethereum account have access of this contract

contract OrgManager{
	struct Organization{
		address account; // org account address
		address contractOrg; // "Org" contract address
		string password; // Org password hash value
	}
    
	mapping (string => Organization) private orgToAccount; // a storage for user and their account, key=username
	uint private count; // number of register User
	function checkValidateOrgs(string memory _username) public view returns (address result){// see if input username already exist
		if(orgToAccount[_username].account == address(0)){
			return orgToAccount[_username].account;
		}else
			return orgToAccount[_username].account;
	}
	function register(address _orgAccount, address _orgContract,
	string memory _username, string memory _password) public{
	    // Adding address and username to mapping, Count++
		orgToAccount[_username] = Organization(_orgAccount, _orgContract, _password);
		count++;
	}
	function login(string memory _username, string memory _password) public view 
	returns (address orgAccount, address orgContract){
		// if username & password is correct, return user address
		if(keccak256(abi.encodePacked(_password)) == keccak256(abi.encodePacked(orgToAccount[_username].password)))
	    	return (orgToAccount[_username].account, orgToAccount[_username].contractOrg);
		else
			return (address(0),address(0));
	}
	
}