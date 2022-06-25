#!/bin/bash

set -e

# prepare template 
rm ./subgraph.yaml || true 
cp ./subgraph_template.yaml ./subgraph.yaml 
sed -i '' -e "s/{{ADDRESS}}/0xde2BFa669d368257D69C4957E9CF2799951aADC1/" ./subgraph.yaml 
sed -i '' -e "s/{{START_BLOCK}}/92947793/" ./subgraph.yaml
sed -i '' -e "s/{{CHAIN}}/aurora-testnet/" ./subgraph.yaml