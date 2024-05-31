#!/bin/bash

RPC_URL="https://tm.axelar.lava.build/lava-referer-114bef37-c7b4-4752-bb3d-3ae62ec01bb8/"

OUTPUT_DIR="logs"

axelar_data=$(curl -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","id":"1","method":"status"}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$axelar_data" >> "$OUTPUT_DIR/axelar.txt"
    
    echo "Axelar data fetched and saved to $OUTPUT_DIR/axelar.txt."
else
    echo "Failed to fetch Axelar data."
fi
