# $Id:$
# $Source:$

usage:
	@echo "usage: make [clean|install]"

clean:
	rm -rf bin develop-eggs parts

bootstrap bin/buildout:
	python2.4 bootstrap.py

build: bin/buildout
	bin/buildout

fg: bin/zope-instance
	bin/zope-instance fg

