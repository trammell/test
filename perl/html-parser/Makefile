usage:
	@echo "usage: make [clean|diff]"

clean:
	rm -f new-expired.html

diff: hiliter.pl
	perl hiliter.pl > new-expired.html
	diff -u expired.html new-expired.html

