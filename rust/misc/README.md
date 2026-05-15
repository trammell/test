
To compile hw.rs:

    rustc hw.rs

## `asdf`

File `.tool-versions` is for `asdf` to manage the rust version.

I am rapidly falling out of love with `asdf` as it does not allow for "virtual
environments" like pyenv does.

## Web Assembly (WASM)


wasm-objdump -x add.wasm


wasm3 --func add add.wasm 2 3
