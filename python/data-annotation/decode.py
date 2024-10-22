#!/usr/bin/env python3


import sys

def decode(messagefile: str) -> str:
    """
    This "decode" function works by first loading the source file into a
    dictionary called "lookup", which maps the integer number of the word to
    the word. Then it looks at the words associated with keys (1, 3, 6, 10,
    ...) which are commonly called "triangular" numbers. The words are saved in
    temporary array "output". Then the values of "output" are concatenated
    together into the return string.
    """

    # fill a lookup table with words
    lookup: Dict[int, str] = {}
    with open(messagefile) as f:
        for line in f:
            number, word = line.split()
            lookup[ int(number) ] = word

    # pull out the words from positions 1, 3, 6, 10, ... (triangular numbers)
    n :int = 1
    output = []
    while True:
        index = n * (n + 1) / 2
        if index in lookup:
            output.append(lookup[index])
            n = n + 1
        else:
            break

    return(" ".join(output))


if __name__ == "__main__":
    print(decode(sys.argv[1]))

