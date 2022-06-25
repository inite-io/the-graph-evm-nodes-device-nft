#!/bin/bash

set -e

# prepare template 
rm ./subgraph.yaml || true 
cp ./subgraph_template.yaml ./subgraph.yaml 
sed -i '' -e "s/{{ADDRESS}}/0xf1577cDb003fc411db83c2E87908C5D45B4c17CD/" ./subgraph.yaml 
sed -i '' -e "s/{{START_BLOCK}}/20388312/" ./subgraph.yaml
sed -i '' -e "s/{{CHAIN}}/chapel/" ./subgraph.yaml