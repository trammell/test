#!/usr/bin/env python

"""

"""

def bsearch(list_,value):
    """Binary search."""

    lower = 0
    upper = len(list_) - 1

    while lower <= upper:

        if list_[lower] == value:
            return lower

        elif list_[upper] == value:
            return upper

        else:
            mid = lower + (upper - lower) / 2
            if list_[mid] == value:
                return mid
            elif list_[mid] < value:
                lower = mid + 1
            else:
                upper = mid - 1

    return None

def rbsearch(list_,value,lower=None,upper=None):
    """Binary search, recursive."""

    # handle empty list
    if len(list_) == 0:
        return None

    # set defaults for lower, upper
    if lower is None or upper is None:
        lower = 0
        upper = len(list_) - 1

    if list_[lower] == value:
        return lower

    elif list_[upper] == value:
        return upper

    elif not lower < upper:
        return None

    else:
        mid = lower + (upper - lower) / 2
        if list_[mid] == value:
            return mid
        elif list_[mid] < value:
            return rbsearch(list_,value,mid+1,upper)
        else:
            return rbsearch(list_,value,lower,mid-1)


