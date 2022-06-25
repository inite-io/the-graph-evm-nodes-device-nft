#!/bin/bash

set -e

# prepare template 
rm ./subgraph.yaml || true 
cp ./subgraph_template.yaml ./subgraph.yaml 
sed -i '' -e "s/{{ADDRESS}}/0xA89714D2388B246d96739ADaB635C2A6A516c3D9/" ./subgraph.yaml 
sed -i '' -e "s/{{START_BLOCK}}/26829926/" ./subgraph.yaml
sed -i '' -e "s/{{CHAIN}}/mumbai/" ./subgraph.yaml