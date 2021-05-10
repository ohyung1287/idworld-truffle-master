pragma solidity ^0.5.0;
import './Zeppelin/ownership/Ownable.sol';
contract Organization is Ownable{
    
    // only UserManager has privilege to set value of Info 
    struct Info{
        string username;
        string password; // hash of password
        string orgName;
        string contactPerson;
        string phone;
        string orgAddress;
        string email;
        bool isApprove;
        string industryType;
        // IPFS icon
        string icon;
    }
    Info private orgInfo;
    // Call by Web3 deploy
    constructor (address _orgAccount,string memory _username, string memory _password,
    string memory _orgName, string memory _contactPerson, string memory _phone,
     string memory _orgAddress, string memory _email, string memory _industryType) public{
        orgInfo = Info(_username, _password, _orgName, _contactPerson, _phone, _orgAddress,
         _email, false, _industryType, "");
        // set owner of contract to current organization
        transferOwnership(_orgAccount);
    }
    function getDataField() public returns(string memory field){
        return "username,password,first,last,headshot,biometric,driverCard,healthCard,citizenshipCard,DoB,homeAddress,email,driver,passportNumber,citizenship,phone,SIN,health,headshot,biometeric,driverCard,healthCard,citizenshipCard,passportImage";
    }
    // only User account can call this method
    function setInfo(string memory _orgName, string memory _contactPerson, string memory _phone,
     string memory _orgAddress, string memory _email, string memory _industryType) public onlyManager 
    {
        orgInfo.orgName = _orgName;
        orgInfo.contactPerson = _contactPerson;
        orgInfo.phone = _phone;
        orgInfo.orgAddress = _orgAddress;
        orgInfo.email = _email;
        orgInfo.industryType = _industryType;
    }
    function approve() public onlyManager{
        orgInfo.isApprove = true;
    }
    function isApprove() public onlyManager returns (bool isApproved){
        return orgInfo.isApprove;
    }
    function getOrgName()public returns (string memory orgName){
        return orgInfo.orgName;
    }
    function getorgContactPerson()public returns (string memory contactPerson){
        return orgInfo.contactPerson;
    }
    function getPhone()public returns (string memory phone){
        return orgInfo.phone;
    }
    function getOrgAddress()public returns (string memory orgAddress){
        return orgInfo.orgAddress;
    }
    function getEmail()public returns (string memory email){
        return orgInfo.email;
    }
    function getIndustryType()public returns (string memory industryType){
        return orgInfo.industryType;
    }
}

