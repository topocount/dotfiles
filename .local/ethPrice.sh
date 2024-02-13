#!/bin/bash

[[ -e ~/.local/EthPrice.txt  ]] && rm ~/.local/EthPrice.txt & rm ~/.local/EthPrice2.txt

curl 'https://api.thegraph.com/subgraphs/name/uniswap/uniswap-v3' \
-X POST \
-H 'content-type: application/json' \
--data '{"query":"query EthPrice {\n  pool(id: \"0x8ad599c3a0ff1de082011efddc58f1908eb6e6d8\") {\n    token0Price\n  }\n}","variables":null,"operationName":"EthPrice","extensions":{"headers":null}}' | \
jq '"Ξ " + (.data.pool.token0Price| tonumber | round | tostring)' > ~/.local/EthPrice2.txt

curl -s https://api.owlracle.info/v4/eth/gas\?apikey\=d72f719b8d00488d869b421a8afcb954 | jq '"; " + (.speeds.[1].maxFeePerGas | round | tostring) + " gwei"' >> ~/.local/EthPrice2.txt

tr -d '\n\"' < .local/EthPrice2.txt > .local/EthPrice.txt
