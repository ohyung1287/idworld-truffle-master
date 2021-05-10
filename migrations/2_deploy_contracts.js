var Ownable = artifacts.require("./zeppelin/ownership/Ownable.sol");
var UsersManager = artifacts.require("./UsersManager.sol");
// var User = artifacts.require("./User.sol");

var OrgManager = artifacts.require("./OrgManager.sol");
module.exports = function(deployer) {
  // deployer.deploy(Ownable);
  // deployer.link(Ownable, SINManager);
  // deployer.deploy(UsersManager);
  deployer.deploy(OrgManager);
  // deployer.deploy(User);
};
