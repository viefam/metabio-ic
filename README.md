# MetaBio

## Overview

MetaBio is a Web3 application to connect gardeners, farmers to crypto world. We aim to be the leading Web3 application for gardening/farming communities, inspire gardeners/farmers, and connect them and their data to enterprise and biology experts eventually.

## Features

🌱 Gardeners could mint the interactive NFPlant backed by their plants.  
🪴 In order to mint NFPlant, they need to purchase the plant pot. Each plant pot will have these attributes:

- plant: NFPlant belonged to the pot.

- minGrowthRate: Plant minimum growth rate. To receive the reward, the plant needs to reach the minimum growth rate (eg: 5cm/month).

- tokenEarning: The token earning when the plant reaches the minGrowthRate each month

🏅 After planting and updating their real plants metadata, they can earn the reward if the plant meets the minimum growth rate.

✅ The BioDAO (biology expert) would review and audit the NFT metadata. Their expertise will help to improve the quality and gain the transparency of biology metadata on-chain.

🚀 MetaBio also supports metaverses, gamefi, defi, and socialfi builders to consume and reuse NFT backed by real plant’s metadata that enhances user experiences.

🌎 Users can earn carbon credit and save the Earth

## Architecture Design

![metabio-architecturev2](https://user-images.githubusercontent.com/4486806/174203740-dc4dc9e8-3c7b-423c-9d34-4360599d72d1.png)

## Implementation

### Implemented Canisters

- [x] nfplant - NFT backed by real plant metadata
- [x] nfpot - NFT Plant pot which user need to purchase to growth the NFPlant and receive the rewards
- [x] mbtv4 - MetaBio Token, utility token for rewards
- [x] metabio - Controllers

  - [x] Allow user to contribute plant metadata
  - [x] Audit plant metadata
  - [x] Record user rewards
  - [x] Distribute user rewards

### Implementing Canisters

- [ ] metabio_dao - MetaBio DAO 
- [ ] metabio_mkp - MetaBio Marketplace

  - [ ] Buy and sell NFPot
  - [ ] Buy and sell NFPlant

- [ ] carbon_credit - Calculate and record carbon credit to users

## Prerequisites

To get started, you might want to explore the project directory structure and the default configuration file. Working with this project in your development environment will not affect any production deployment or identity tokens.

To learn more before you start working with nfpot, see the following documentation available online:

- [Quick Start](https://sdk.dfinity.org/docs/quickstart/quickstart-intro.html)
- [SDK Developer Tools](https://sdk.dfinity.org/docs/developers-guide/sdk-guide.html)
- [Motoko Programming Language Guide](https://sdk.dfinity.org/docs/language-guide/motoko.html)
- [Motoko Language Quick Reference](https://sdk.dfinity.org/docs/language-guide/language-manual.html)
- [JavaScript API Reference](https://erxue-5aaaa-aaaab-qaagq-cai.raw.ic0.app)

If you want to start working on your project right away, you might want to try the following commands:

```bash
cd nfpot/
dfx help
dfx config --help
```

## Deployed Canisters

- mbtv4: https://a4gq6-oaaaa-aaaab-qaa4q-cai.raw.ic0.app/?id=2xiao-caaaa-aaaak-qaqya-cai
- metabio: https://a4gq6-oaaaa-aaaab-qaa4q-cai.raw.ic0.app/?id=2qjg2-pyaaa-aaaak-qaqyq-cai
- nfplant: https://a4gq6-oaaaa-aaaab-qaa4q-cai.raw.ic0.app/?id=2zkng-zqaaa-aaaak-qaqza-cai
- nfpot: https://a4gq6-oaaaa-aaaab-qaa4q-cai.raw.ic0.app/?id=6p6vz-qiaaa-aaaak-qaqbq-cai

## Demo

- Change MetaBio owner principal at https://github.com/viefam/metabio-ic/blob/develop/src/nfpot/metabio.mo#L33 and https://github.com/viefam/metabio-ic/blob/develop/src/nfpot/metabio.mo#L33 as your preferred one.

- Run the following commands:

```bash
# Starts the replica, running in the background
dfx start --background

# Deploys your canisters to the replica and generates your candid interface
dfx deploy
```

- Create [gardener identity](https://internetcomputer.org/docs/current/references/cli-reference/dfx-identity) and change to it. Do not use the owner principal.

```
dfx identity use gardener
```

- Contribute plant meta with ID, created_at, length and images from our system.

```
dfx canister call metabio contributePlantMeta '("9OYATqDnq5", 1655375202615, 60, "https://images.viefam.com/stag/5482d443ce8f69463d6ef431c21f6d6a_front_315cf7a0-19d5-4614-9596-e13abd9b09a8.jpg", "https://images.viefam.com/stag/fe9c3efba7e3b370f71ecbb2879fedbe_left_07703946-8173-480f-bd0f-aabdede1df67.jpg", "https://images.viefam.com/stag/0f4e5795676dc3865b8f5bea8431ab64_back_6223f4f4-988b-4227-891c-afe4bdac2391.jpg", "https://images.viefam.com/stag/e3c076977719bc9ed3fa363b8fbed760_right_452d2966-1e20-4356-98f2-394df820af73.jpg")'
```

*It should show the reward ID then.*

```
(1 : nat)
```

- Display the reward information by using above reward ID.

```
dfx canister call metabio displayReward '(1)'
```

*It should display the pending reward*

```
(
  record {
    id = 1 : nat;
    status = variant { pending };
    plantMeta = 1 : nat;
    user = principal "jd2i6-4skfe-sgnim-636u7-cysgv-ixwny-kgkjc-aoadx-sg542-lguic-6qe";
    rewards = 100 : nat;
  },
)
```

- Change to owner identity

```
dfx identity use default
```

- Distribute reward to user

```
dfx canister call metabio distributeReward '(1)'
```

- Change to gardener identity and check MetaBio Token balance

```
// Get principal
dfx identity get-principal
```

*It should return principal. Example: `jd2i6-4skfe-sgnim-636u7-cysgv-ixwny-kgkjc-aoadx-sg542-lguic-6qe`*

```
dfx canister call mbtv4 balanceOf '(principal "jd2i6-4skfe-sgnim-636u7-cysgv-ixwny-kgkjc-aoadx-sg542-lguic-6qe")'
```

*It should display 100 or increase to 100.*

## Mobile App

We are going to implement the MetaBio app with following features

- [ ] Connect Web2 users to Internet Computer: it makes easier for non-crypto users can connect to crypto world

![login-screen](https://user-images.githubusercontent.com/4486806/174244747-7a70ae10-383b-4cb4-a4c8-ddc149f18b44.png)


- [ ] Buy NFPot and NFPLant on Marketplace

![Screen Shot 2022-06-17 at 14 09 13](https://user-images.githubusercontent.com/4486806/174244891-e42eb67c-696b-4a27-b17c-e4846011e5af.png)


- [ ] Mint plant to NFPot

![Screen Shot 2022-06-17 at 14 10 03](https://user-images.githubusercontent.com/4486806/174245037-a369190a-eac5-40aa-93c5-3cb251356e88.png)

- [ ] Withdraw reward

- [ ] Carbon Credit


In Supernova Hackathon, we haven't integrated yet our mobile app to Internet Computer because iternet-identity haven't supported yet authetication (https://github.com/dfinity/internet-identity/issues/340, https://github.com/dfinity/internet-identity/issues/332). Another wallet or solution still haven't supported mobile application yet. 

However, we had the prototype video (https://drive.google.com/file/d/1Ky1aIM3PbbabwFdjyUjXSkz2edAbHbKc/view) about MetaBio that we try to integrate with BNB chain. 

*P/s: We are trying the solution that using WebView to authenticate. And we will have the mobile app on IC soon*
