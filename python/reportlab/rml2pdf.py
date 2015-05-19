#!/usr/bin/env python2.4

import sys
from z3c.rml import rml2pdf

for arg in sys.argv[1:]:
    rml2pdf.go(arg)

