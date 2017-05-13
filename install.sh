#!/usr/bin/env bash

##############################################################################
#
# @category "AEternity - The Oracle Machine"
# @package "AETERNITY Testnet"
# @coauthor Miguel Padilla <miguel.padilla@zwilla.de>
# @copyright (c) 2017 - Miguel Padilla
# @link "https://www.the-internet-of-money.de/aeternity"
#
# According to our dual licensing model, this program can be used either
# under the terms of the GNU Affero General Public License, version 3,
# or under a proprietary license.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
##############################################################################
#

if [ -e "rebar" ]; then
#rm rebar;
fi;

# first install rebar package manager

if [ -e "rebar" ];
then
    echo "rebar already installed \n";

elif [[ `uname -s` == `Linux` ]];
then
    echo "download rebar on Linux";
    # Rebar 2
     wget https://raw.githubusercontent.com/wiki/rebar/rebar/rebar && chmod u+x rebar;
    #
    # Rebar3
    #wget https://s3.amazonaws.com/rebar3/rebar3 && chmod +x rebar3
elif [[ `uname -s`==Darwin ]];
then
    echo "get rebar for Darwin now! \n";
    curl https://raw.githubusercontent.com/wiki/rebar/rebar/rebar -o rebar;
    chmod u+x *.sh;
    #chmod u+x rebar;
    chmod u+x rebar3;

else
    echo "your system can't compile aeternity at moment! Check our website for more details \n";
fi;

echo "Do you want to check for updates now! Hit ENTER if yes and 'n' if not. \n";
read -t 5 fetchupdates;


if [[ "$fetchupdates" == "n" ]]; then
echo "OK! We start to compile now! \n"
else
echo "starting Testnet now! \n"
sh update.sh
fi



if [ -e "rebar3" ];
then
    echo "rebar already installed \n";

elif [[ `uname -s` == `Linux` ]];
then
    echo "install rebar on Linux";
    sudo ./rebar3 local upgrade # check for rebar updates
    sudo ./rebar3 get-deps
    sudo ./rebar3 compile

elif [[ `uname -s`==Darwin ]];
then
    echo "install rebar for Darwin now! \n";
    rebar3 local upgrade # check for rebar updates
    chmod u+x rebar;
    chmod u+x *.sh;
    #without sudo we get an error on compiling on osx
    sudo ./rebar3 get-deps
    sudo ./rebar3 compile


else
    echo "your system can't compile aeternity at moment! Check our website for more details \n";
fi;

#use rebar to install other dependencies, explained in rebar.config


echo "Do you want to delete the blocks? Hit ENTER if YES and 'n' if yes. \n";
read -t 5 deleteblocks ;


if [[ "$deleteblocks" == "n" ]]; then
echo "not deleting blocks! \n";
rm yesclean.txt;
else
touch yesclean.txt;
echo "clean it now and backup keys \n";
#this deletes the database so every time we re-start, we have 0 blocks again. only needed during testing.
sh clean.sh;
echo "deleting blocks and deps ready! \n";

fi;

echo "Successfully compiled Aeternity testnet \n"

echo "Do you want to start the TestNet now? (y/n) hit ENTER for starting or 'n' to stop now! \n"
read -t 5 startnow;


if [[ "$startnow" == "n" ]]; then
echo "OK installation ready for now! \n"
exit

else
echo "starting Testnet now! \n"
# start on default testnet port 8040 and 8041
sh start.sh

#sh start.sh 3020
# before we do this we need to copy the project into new folder
echo "http://127.0.0.1:8041/login.html"
fi
