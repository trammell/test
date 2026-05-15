
RUSTC = rustc

usage:
	@echo "usage: make [clean|all]"

clean:
	rm -f hw immutable memcheck memcheck2 add

all: hw immutable memcheck memcheck2 add

% : %.rs
	-$(RUSTC) -o $@ $<


%.wasm: %.rs
	-$(RUSTC) -A dead_code --target wasm32-unknown-unknown -O --crate-type=cdylib -o $@ $<
