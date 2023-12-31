# tree-sitter wasm test

Setup for experimenting with web-tree-sitter wasms.

## Setup

1. Find the desired SHA of tree-sitter you'd like to use from the [list of commits](https://github.com/tree-sitter/tree-sitter/commits/master)
2. Run `./scripts/download-wasm-for-sha.sh $SHA` to download the wasm for that SHA
3. [Get a wasm](https://github.com/tree-sitter/tree-sitter/blob/master/lib/binding_web/README.md#generate-wasm-language-files) for a programming language and put it in the `web` directory
4. Modify the params in [web/test.html](web/test.html) as necessary for your language
5. Start a web server in the `web` directory of this repo (eg `npx http-server web -a 127.0.0.1 -p 8080`)
6. Go to `http://127.0.0.1:8080/test.html` in your browser and open the debug console to see the output.
