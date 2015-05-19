# $Id: Makefile,v 1.1 2007/08/17 19:06:45 johnt Exp $

usage:
	@echo "usage: make [clean|install]"

clean:
	rm -f *.bak foo.pdf
	cp -a foo.orig foo.pdf

strip:
	perl -ni.bak strip.pl foo.pdf

