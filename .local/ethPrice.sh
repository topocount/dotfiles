#!/bin/bash

source /run/user/1000/keybase/kbfs/private/kevbot/.env.local

[[ -e ~/.local/EthPrice.txt  ]] && rm ~/.local/EthPrice.txt & rm ~/.local/EthPrice2.txt

curl https://api.etherscan.io/api\?module=stats\&action=ethprice\&apikey=${ETHERSCAN_API_KEY} | \
  jq '"Ξ " + (.result.ethusd | tonumber | round | tostring)' > ~/.local/EthPrice2.txt

curl -s https://api.owlracle.info/v4/eth/gas\?apikey\=${OWLRACLE_API_KEY} | jq '"; " + (.speeds.[1].maxFeePerGas | round | tostring) + " gwei"' >> ~/.local/EthPrice2.txt

tr -d '\n\"' < .local/EthPrice2.txt > .local/EthPrice.txt

# get the weather
curl -sSL wttr.in/rst\?u\&format\=2 > .local/weather.txt
