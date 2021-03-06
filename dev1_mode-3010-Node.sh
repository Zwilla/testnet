#!/usr/bin/env bash
# this script will be called from initd-aeternity.sh script
# do not call it allone
#
# How To?
# Starting testnet with this command:
#
# sh setup_test.sh
#
# Kill all Testnet Server with this command:
#
# sh initd-aeterity.sh stop
#
# READ THIS: https://github.com/Zwilla/aeternity-testnet/blob/master/docs/testnet.md
# start Aeternity FULL Node and start mining
erl -pa ebin deps/*/ebin/ -eval "application:ensure_all_started(testnet), serve:pw(3010), keys:lock(), peers:add({127,0,0,1}, 3020), peers:add({127,0,0,1}, 3030)"