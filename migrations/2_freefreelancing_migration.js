var FreelanceJob = artifacts.require("FreelanceJob");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(FreelanceJob);
};