#!/bin/bash

set -e

# prepare template 
rm ./subgraph.yaml || true 
cp ./subgraph_template.yaml ./subgraph.yaml 
sed -i '' -e "s/{{ADDRESS}}/0xE1702438e35F2AD59f173eAd1fF4f9e088e6dB40/" ./subgraph.yaml 
sed -i '' -e "s/{{START_BLOCK}}/26238988 /" ./subgraph.yaml
sed -i '' -e "s/{{CHAIN}}/matic/" ./subgraph.yaml