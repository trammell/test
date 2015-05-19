usage:
	@echo "usage: make [clean|select]"

clean:
	rm -f tutorial.db tutorial.db*

select: tutorial.db
	echo "select * from users;" | sqlite3 tutorial.db



