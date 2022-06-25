#!/bin/bash

set -e

# prepare template 
rm ./subgraph.yaml || true 
cp ./subgraph_template.yaml ./subgraph.yaml 
sed -i '' -e "s/{{ADDRESS}}/0x50180Ad71749bdb9A989A659b74AF77947F4d0D5/" ./subgraph.yaml 
sed -i '' -e "s/{{START_BLOCK}}/26238988 /" ./subgraph.yaml
sed -i '' -e "s/{{CHAIN}}/matic/" ./subgraph.yaml