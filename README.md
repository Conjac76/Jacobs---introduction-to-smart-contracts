# Group Members

- Connor Jacobs (Created the Escrow Struct and Functions which gets rid of the need of malicious 3rd party services)
- Eric Phan (Created a set of functions to create a pause between transactions in functions in order to add more security, Updated the ReadMe)

# Overall View of the Project

The open source software project I will be trying to make is an NBA database site. This database will automatically read from live NBA games/streams which will automatically update statistics and scores for each and every member and team that will/have played within the current season. While the official NBA site has this already, what if you want to be able to manipulate or even read specific data? What if you want this displayed in a way where it is easily digestible? You would have to manually input all the data or statistics into your own separate data fields. Followed by calculating percentages or averages yourself which can be tedious (especially repeating this season after season). Just transferring the data itself is already a long, laborious process and even after that you would still need to perform the correct calculations in order to find the precise information that you require. What if there was a way to completely cut out the procedure of transferring data? By creating this manipulatable data, users are able to do whatsoever they would like with it. 

The mission/goal is to help users create a masterful team that will help them succeed in any fantasy basketball league of their choice. Users will be able to search up incredibly specific stats in order to learn from certain players and their talents as well as skillset. While of course some of it does come down to luck and how NBA players stay healthy, studying each player's skills can come in handy especially looking towards the long term. This could also be a way for coaches or even scouting staff to study how particular players operate on the floor so that teams can adjust to their playing style to accurately adjust to specific needs. Overall, this also allows for students or people interested in studying data analytics or statistics a chance to learn about a field in sports.


# Instructions
Run the code through the Remix Merge VM

# Goals and Plans for the Project

- [x] Add a Level of Security

- [x] Update Functionality of Original Template

- [x] Test The Project

- [?] Deploy the Project

- [x] Make the Given Template Revolve Around our Idea

# Other Information

## Required Steps for Testing and Deployment

Install Foundry -> https://book.getfoundry.sh/getting-started/installation.html

```
npm i # install project npm modules
forge install # install project foundry modules
```

Configure `.env` file -> see [`.env.example`](https://github.com/alexhkurz/introduction-to-smart-contracts/blob/main/.env.example). (Go to your Metamask, follow "Goerli test network->Account details->Export private key" and enter the private key in your `.env` (for the `PRIVATE_KEY` variables); make an account with [alchemy](https://www.alchemy.com/), create a test app for the Ethereum chain on the Goerli network and fill in the value for `ALCHEMY_API_KEY`.)

This framework has been written to use various testnets and mainnets. Test ETH has been encoded into the tasks for localhost deployment. For testnets, test ETH, BNB, or ETC is required which can be received from their corresponding faucets. An .env is used for running on other networks outside of localhost.

Configured Networks:

- Localhost
- Goerli. Faucet: https://goerlifaucet.com/
- BSC Testnet. Faucet: https://testnet.bnbchain.org/faucet-smart
- BSC.
- Mordor. Faucet: https://easy.hebeswap.com/#/faucet

## NPM Commands

```
npm run compile # runs hardhat compile
npm run clean # runs hardhat clean
npm run test # runs unit tests via Forge
```

## Hardhat Tasks

To deploy your contract use

```
npx hardhat --network goerli deploy --contract <contract_name> 
```

If you get `Error: insufficient funds` go to [goerlifaucet](https://goerlifaucet.com/), use your Alchemy login, and enter the wallet address you get from your Metamask wallet. If everything worked you see in your terminal

`Contract deployed to: <deployed_contract_address>    

To "verify" your contract run

```
npx hardhat --network goerli verify <deployed_contract_address> 
```

If you get `Error [...] no API token was found` go to [Etherscan](https://etherscan.io/), create an account, get an API-key and add it to your `.env` 

Now you should be able to interact via your Metamask wallet with your contract on the testnetwork.

Summary of hardhat commands:

```
npx hardhat # lists all available hardhat tasks

npx hardhat --network <network_name> balance --account <account_address> # retrieves account balance on specified network

npx hardhat --network <network_name> deployproxy --contract <contract_name> # Deploys provided upgradeable contract to specified network. Proxy type is UUPS

npx hardhat --network <network_name> flatten <contract_file_path> > <output_file_path> # Flattens contracts and dependecies to output file

npx hardhat --network <network_name> initialize --contract <contract_name> --contract-address <deployed_contract_address> # Initializes provided upgradeable contract on specified network

npx hardhat --network <network_name> validateupgrade --contract <new_contract_name> --proxy-address <deployed_proxy_contract_address> # Validates new implementation contract without deploying it

npx hardhat --network <network_name> deploy --contract <contract_name> # Deploys given contract to specified network

npx hardhat --network <network_name> verify <deployed_contract_address> # verifies source code on Etherscan or BSCSCAN. Supported networks are Goerli, BSC, BSC Testnet
```
