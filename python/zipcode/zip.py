#!/usr/bin/env python2.4

"""
"""

import re


def isValidZipcodeString(zip):
    """
    Returns True if 'zip' is a valid marketing zipcode string.  A string is
    composed of zero or more chunks, separated by commas.  Any whitespace is
    ignored.  Valid chunks are:
        1. a Canadian Forward Sortation Area (FSA), or two FSAs separated by a
           hyphen
        2. a 3-digit US zipcode prefix (ZIP3), or two ZIP3s separated by a
           hyphen
        3. a 5-digit US zipcode (ZIP5), or two ZIP5s sepearated by a hyphen
        4. any of the above, separated by a hyphen

    Examples of valid zipcode strings:

        "123"
        "123-456"
        "55121"
        "12300-45600"
        "A0A"
        "A0A-A0B"
        "123, 123-456, 55121, A0A-A0B"

    Examples of invalid zipcode strings:

        "1"
        "1234"
        "55121-1553"
        "A"
        "555-AOA"
        "123; 123-456; 55121; A0A-A0B"

    """

    zip = re.sub(r'\s', '', zip)

    is_any = re.compile(r'(?:\d{3}|\d{5}|[A-Z]\d[A-Z])$', re.I).match
    is_fsa = re.compile(r'[A-Z]\d[A-Z]$', re.I).match
    is_zip3 = re.compile(r'\d{3}$').match
    is_zip5 = re.compile(r'\d{5}$').match

    for chunk in zip.split(','):

        if is_any(chunk):
            continue
        elif '-' in chunk:
            z1, z2 = chunk.split('-')
            if is_fsa(z1) and is_fsa(z2):
                continue
            elif is_zip3(z1) and is_zip3(z2):
                continue
            elif is_zip5(z1) and is_zip5(z2):
                continue

        return False
