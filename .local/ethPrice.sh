#!/bin/bash

[[ -e ~/.local/EthPrice.txt  ]] && rm ~/.local/EthPrice.txt & rm ~/.local/EthPrice2.txt

curl https://api.etherscan.io/api\?module=stats\&action=ethprice | \
  jq '"Ξ " + (.result.ethusd | tonumber | round | tostring)' > ~/.local/EthPrice2.txt

curl -s https://api.owlracle.info/v4/eth/gas\?apikey\=d72f719b8d00488d869b421a8afcb954 | jq '"; " + (.speeds.[1].maxFeePerGas | round | tostring) + " gwei"' >> ~/.local/EthPrice2.txt

tr -d '\n\"' < .local/EthPrice2.txt > .local/EthPrice.txt

# get the weather
curl -sSL https://wttr.in/RST\?format\=2\&u > .local/weather.txt
