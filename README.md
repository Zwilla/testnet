æternity
==========

This is the code used for the testnet for the [æternity](https://aeternity.com) project.

This testnet uses simple PoW consensus. Its purpose is to show how state-channels work.

### Compiling and Runing
You will need Erlang version 18 or higher, and a couple of libraries. Please follow instructions:
[For Ubuntu](docs/compile_ubuntu.md)
[For Mac](docs/compile_mac.md)

Then, start your node with following script:
```
sh start.sh <port>
```

To download updates do this:
```
sh update.sh
```

### Commands

#### Sync with the network
To sync with the network and download the blockchain: 

Then, start your node with following script:
```
sh start.sh <port>
```
- port for:
- testnet = 8041
- node 1  = 3010
- node 2  = 3020

aso.

### Commands

#### Sync with the network
To sync with the network and download the blockchain: 
```
easy:sync().
```

#### Mining
After fresh install, one can start mining.

To start mining with all CPU cores: 
```
mine:start().
```
You will see something like this:

start mining with 4 cores.
ok

To stop mining:
```
mine:stop().
```
to check if you are currently mining:
```
mine:is_on().
```

#### Spend
```
easy:spend(To, Amount).
```
To is the recipient's account ID

#### Last transactions
```
tx_pool:data().
```

#### Find out your account ID
```
keys:id().
```
If it returns something less than 1, that means you don't have an account yet.

#### Create an account
(does get done automatically when no accocunt and mining starts)
[Make an account](docs/new_account.md)

#### Check your balance
```
easy:balance().
```

#### Stop a node
To stop a node run:
```
easy:off().
```


### Else
If you want to know more, check out our whitepaper on [aeternity.com](https://aeternity.com) and get in touch with us via [Gitter Chat](https://gitter.im/aeternity?Lobby) or write us (emails in whitepaper). 