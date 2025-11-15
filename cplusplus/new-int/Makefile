
.PHONY: usage

usage:
	@echo "usage: make [clean|build]"

clean:
	rm -f newint

build: newint

newint: newint.cxx
	g++ newint.cxx -o newint

