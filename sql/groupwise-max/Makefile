# $Id:$
# $Source:$

usage:
	@echo "usage: make [clean|install]"

clean:

install:

world: world.sql.gz
	-mysqladmin create world
	-zcat world.sql.gz | mysql world

