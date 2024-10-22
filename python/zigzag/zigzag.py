#!/usr/bin/env python3

"""
Zigzag string conversion, see https://leetcode.com/problems/zigzag-conversion/
"""

from typing import Generator

import unittest


def zigzag(nrows: int) -> Generator[tuple[int, int], None, None]:
    """
    Return a list of zigzag coordinates, based on the value of nrows.

    The rows have a pattern that looks like this:

        0 1 2   3 2 1   0 1 2   3 2 1

    The columns have a pattern that looks like this:

        0 0 0   0 1 2   3 3 3   3 4 5

    """

    assert nrows > 0

    # This is a special case for nrows == 1; I don't know how to handle this gracefully.
    if nrows == 1:
        idx: int = 0
        while True:
            yield (0, idx)
            idx += 1

    else:
        idx: int = 0
        a = list(range(nrows - 1)) + list(range(nrows - 1, 0, -1))
        b = ([0] * (nrows - 1)) + list(range(nrows - 1))
        while True:
            row = a[idx % len(a)]
            offset = idx // (2 * nrows - 2)
            col = offset * (nrows - 1) + b[idx % len(b)]
            yield (row, col)
            idx += 1


class TestZigzag(unittest.TestCase):
    def test_one_row(self):
        zz = zigzag(1)
        actual = [next(zz) for _ in range(10)]
        expected = [
            (0, 0),
            (0, 1),
            (0, 2),
            (0, 3),
            (0, 4),
            (0, 5),
            (0, 6),
            (0, 7),
            (0, 8),
            (0, 9),
        ]
        self.assertEqual(actual, expected)

    def test_two_rows(self):
        zz = zigzag(2)
        actual = [next(zz) for _ in range(10)]
        expected = [
            (0, 0),
            (1, 0),
            (0, 1),
            (1, 1),
            (0, 2),
            (1, 2),
            (0, 3),
            (1, 3),
            (0, 4),
            (1, 4),
        ]
        self.assertEqual(actual, expected)

    def test_paypal_rows(self):
        """Test the row component of the "paypal" example."""
        zz = zigzag(4)
        actual = [next(zz)[0] for _ in range(21)]
        expected = [0, 1, 2, 3, 2, 1, 0, 1, 2, 3, 2, 1, 0, 1, 2, 3, 2, 1, 0, 1, 2]
        self.assertEqual(actual, expected)

    def test_paypal_cols(self):
        """Test the column component of the "paypal" example."""
        zz = zigzag(4)
        actual = [next(zz)[1] for _ in range(21)]
        expected = [0, 0, 0, 0, 1, 2, 3, 3, 3, 3, 4, 5, 6, 6, 6, 6, 7, 8, 9, 9, 9]
        self.assertEqual(actual, expected)

        # for j in range(0, 20):
        #    tup = next(zz)
        # for idx, tup in enumerate(rowcol(4)):


if __name__ == "__main__":
    unittest.main()
