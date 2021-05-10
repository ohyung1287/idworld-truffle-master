pragma solidity ^0.5.0;
// TODO
// only manager ethereum account have access of this contract

contract ThirdPartyList{
    struct ThirdParty{
        string companyName;
        address userAddress;
        string securityLevel; // 0~3
        string token; //jwt token
    }
    mapping (string => ThirdParty) private tokenToThirdparty; // key:token 
    function set(string memory companyName, address userAddress, 
    string memory securityLevel, string memory token) public {
        tokenToThirdparty[token] = ThirdParty(companyName,userAddress,securityLevel,token);
    }
    function get(string memory token) public returns(address userAddress, string memory securityLevel){
        return (tokenToThirdparty[token].userAddress, tokenToThirdparty[token].securityLevel);
    }
}