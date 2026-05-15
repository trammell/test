
RUSTC = rustc

usage:
	@echo "usage: make [clean|all]"

clean:
	rm -f hw immutable memcheck memcheck2

all: hw immutable memcheck memcheck2

% : %.rs
	-$(RUSTC) -o $@ $<


