pragma solidity ^0.5.0;
import './Zeppelin/ownership/Ownable.sol';
contract User is Ownable{
    /*   
    TODO

    */
    // only UserManager has privilege to set value of Info 
    struct Info{
        string username;
        string password; // hash of password
        string first;
        string last;
        string DoB;
        string homeAddress;
        string email;
        string phone;
        bool creditFree;
        string driver;
        string passportNumber;
        string citizenship;
        // string mobile
        string SIN;
        string health;
        // IPFS headshot
        string headshot;
        // IPFS biometric
        string biometric;
        // IPFS driverCard
        string driverCard;
        // IPFS healthCard
        string healthCard;
        // IPFS citizenshipCard
        string citizenshipCard;
        // IPFS passportImage
        string passportImage;
    }
    Info private personalInfo;
    // Call by Web3 deploy
    constructor (address _userAccount,string memory _username, string memory _password,
    string memory _first, string memory _last, string memory _email) public{
        personalInfo = Info(_username, _password, _first, _last, "" , "",
        _email, "",false, "", "", "", "","","","","","","","");
        // set owner of contract to current user
        transferOwnership(_userAccount);
    }
    function getDataField() public view returns(string memory field){
        return "username,password,first,last,headshot,biometric,driverCard,healthCard,citizenshipCard,DoB,homeAddress,email,driver,passportNumber,citizenship,phone,SIN,health,headshot,biometeric,driverCard,healthCard,citizenshipCard,passportImage";
    }
    function setSIN(string memory SIN) public onlyManager{
        personalInfo.SIN = SIN;
    }
    function getSIN() public view onlyOwner returns(string memory SIN){
        return personalInfo.SIN;
    }
    function changeCrediteFreeState() public{
        personalInfo.creditFree = !personalInfo.creditFree;
    }
    function getCrediteFreeState() public view returns(bool creditFree){
        return personalInfo.creditFree;
    }
    // only User account can call this method
    function setInfo(string memory first, string memory last, string memory DoB,
    string memory homeAddress, string memory email, string memory driver, 
    string memory passport, string memory citizenship, string memory phone, 
    string memory SIN, string memory health) public onlyManager 
    {
        personalInfo.first = first;
        personalInfo.last = last;
        personalInfo.DoB = DoB;
        personalInfo.homeAddress = homeAddress;
        personalInfo.email = email;
        personalInfo.phone = phone;

        personalInfo.driver = driver;
        personalInfo.passportNumber = passport; 
        personalInfo.citizenship = citizenship;
        personalInfo.SIN = SIN;
        personalInfo.health = health;
    }
    function setBasicInfo(string memory first, string memory last, string memory DoB,
    string memory homeAddress, string memory email, string memory phone) public onlyManager 
    {
        personalInfo.first = first;
        personalInfo.last = last;
        personalInfo.DoB = DoB;
        personalInfo.homeAddress = homeAddress;
        personalInfo.email = email;
        personalInfo.phone = phone;
    }
    function setPrivateInfo(string memory driver,string memory passport, 
    string memory citizenship, string memory health) public onlyManager 
    {
        personalInfo.driver = driver;
        personalInfo.passportNumber = passport; 
        personalInfo.citizenship = citizenship;
        personalInfo.health = health;
    }


    function setHeadshot(string memory headshot)public onlyManager{
        personalInfo.headshot = headshot;
    }
    function getHeadshot() public view onlyOwner returns(string memory headshot){
        return personalInfo.headshot;
    }
    function setCitizenshipCard(string memory citizenshipCard)public onlyManager{
        personalInfo.citizenshipCard = citizenshipCard;
    }
    function getCitizenshipCard()  public view onlyOwner returns(string memory citizenshipCard){
        return personalInfo.citizenshipCard;
    }
    function setHealthCard(string memory healthCard)public onlyManager{
        personalInfo.healthCard = healthCard;
    }
    function getHealthCard()  public view onlyOwner returns(string memory healthCard){
        return personalInfo.healthCard;
    }
    function setDriverCard(string memory driverCard)public onlyManager{
        personalInfo.driverCard = driverCard;
    }
    function getDriverCard()  public view onlyOwner returns(string memory driverCard){
        return personalInfo.driverCard;
    }
    function setPassportImage(string memory passportImage)public onlyManager{
        personalInfo.passportImage = passportImage;
    }
    function getPassportImage() public returns(string memory passportImage){
        return personalInfo.passportImage;
    }
    function setBiometric(string memory biometric)public onlyManager{
        personalInfo.biometric = biometric;
    }
    function getBiometric()  public view onlyOwner returns(string memory biometric){
        return personalInfo.biometric;
    }
    function getUsernamePass()  public view onlyOwner onlyOwner 
    returns(string memory userName, string memory password){
        return (personalInfo.username, personalInfo.password);
    }
    // function setUsername(string memory username) public onlyManager 
    // {
    //     personalInfo.username = username;
    // }
    function getName()  public view onlyOwner 
    returns(string memory first, string memory last){
        return (personalInfo.first, personalInfo.last);
    }
    // function setName(string memory first,string memory last) public onlyManager 
    // {
    //     personalInfo.first = first;
    //     personalInfo.last = last;
    // }
    function getDoB()  public view onlyOwner 
    returns(string memory DoB){
        return personalInfo.DoB;
    }
    // function setDoB(string memory DoB) public onlyManager 
    // {
    //     personalInfo.DoB = DoB;
    // }
    function getHomeAddress() public view onlyOwner 
    returns(string memory homeAddress){
        return personalInfo.homeAddress;
    }
    // function setHomeAddress(string memory homeAddress) public onlyManager 
    // {
    //     personalInfo.homeAddress = homeAddress;
    // }
    function getEmail() public view onlyOwner 
    returns(string memory email){
        return personalInfo.email;
    }
    // function setEmail(string memory email) public onlyManager 
    // {
    //     personalInfo.email = email;
    // }
    function getDriver() public view onlyOwner 
    returns(string memory driver){
        return personalInfo.driver;
    }
    // function setDriver(string memory driver) public onlyManager 
    // {
    //     personalInfo.driver = driver;
    // }
    function getPassport() public view onlyOwner 
    returns(string memory passportNumber){
        return personalInfo.passportNumber;
    }
    // function setPassport(string memory passport) public onlyManager 
    // {
    //     personalInfo.passportNumber = passport;
    // }
    function getCitizenshipNumber() public view onlyOwner 
    returns(string memory citizenship){
        return personalInfo.citizenship;
    }
    // function setCitizenshipNumber(string memory citizenship) public onlyManager 
    // {
    //     personalInfo.citizenship = citizenship;
    // }
    function getPhone() public view onlyOwner 
    returns(string memory phone){
        return personalInfo.phone;
    }
    function getHealth() public view onlyOwner 
    returns(string memory health){
        return personalInfo.health;
    }
    // function setHealth(string memory health) public onlyManager 
    // {
    //     personalInfo.health = health;
    // }
}

