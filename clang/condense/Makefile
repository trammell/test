
    CFLAGS := -Wall -Wextra -pedantic

default: condense

clean:
	rm -f *.o condense

condense: condense.o

test:
	make clean
	make condense
	./condense

