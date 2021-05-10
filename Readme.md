# Installation

- git pull

## Deploy new contract in command line

- `truffle migrate --reset --network ropsten` to deploy your contract to Ropsten network.
- To config the migration file, make changes in `migrations\2_deploy_contracts.js` file.
- Once contracts be deployed, you will et the ABI files in `build` folder. You should always put the newest ABI file in the client App.
- `truffle build` will generate the ABI file without deploy to network.

## Deploy network configuration

- In `truffle.js` file, adding whatever network object.
- `truffle migrate --reset --network NEWNET` to deploy our contract to the new network

# Contracts

## UsersManager

- A contract that management all users account and contract address, provides login and sign methods for client App.

### Props

1. mapping - userToAccount : a storage for user and their account, key=username
2. mapping - SINToAccount : key = SIN, value = account address
3. mapping - SINToCredit : key = SIN, value = credit freeze

### Methods

1. create, update, get credit : read or update the value of credit freeze with SIN number.
2. getUserBySIN : input SIN number, return user contract address
3. changeSIN : update user SIN number
4. checkValidateUsers : input username, return usercontract address if exist. If username is not avaliable, return 0x0000000000.
5. register : add the value into userToAccount mapping.
6. login : input username & password, return the user contract address & account.
