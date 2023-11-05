# tree-sitter wasm test

Setup for experimenting with web-tree-sitter wasms.

## Setup

1. Find the desired SHA of tree-sitter you'd like to use from the [list of commits](https://github.com/tree-sitter/tree-sitter/commits/master)
2. Run `./scripts/download-wasm-for-sha.sh $SHA` to download the wasm for that SHA
3. Get a wasm for a programming language and put it in the `web` directory
4. Start a web server in the `web` directory of this repo (eg `npx http-server out -a 127.0.0.1 -p 8080`)
5. Go to `http:127.0.0.1:8080/test.html` in your browser and open the debug console to see the output.
