#!/bin/bash

set -euo pipefail

# Remove old wasm files
rm -f web/tree-sitter.wasm
rm -f web/tree-sitter.js

# Check for jq availability
if ! command -v jq &>/dev/null; then
    echo "jq could not be found"
    exit 1
fi

# Check for gh availability
if ! command -v gh &>/dev/null; then
    echo "gh could not be found"
    exit 1
fi

# Check number of arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <commit_sha>"
    exit 1
fi

COMMIT_SHA="$1"

# Get runs and filter by COMMIT_SHA
RUN_DATA=$(gh run list --repo tree-sitter/tree-sitter --branch master -w CICD --json headSha,databaseId -q "map(select(.headSha == \"$COMMIT_SHA\")) | .[0].databaseId" 2>/dev/null)

# Check for gh errors
if [ $? -ne 0 ]; then
    echo "Error fetching runs from GitHub."
    exit 1
fi

# Check for empty data indicating SHA not found
if [ -z "$RUN_DATA" ]; then
    echo "No run found for SHA $COMMIT_SHA."
    exit 1
fi

# Output the run databaseId
echo "Fetching wasm for run SHA $COMMIT_SHA (run id is $RUN_DATA):"

gh run download "$RUN_DATA" --repo "tree-sitter/tree-sitter" --name tree-sitter.wasm --dir "web"
