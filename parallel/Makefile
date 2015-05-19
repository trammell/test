
clean:
	rm -f abc-file def-file abc0-file abc_-file
	rm -f tsv-file.tsv num30000 num1000000 num_%header

all: abc-file def-file abc0-file abc_-file tsv-file.tsv num30000 num1000000 num_%header

abc-file:
	parallel -k echo ::: A B C > abc-file

def-file:
	parallel -k echo ::: D E F > def-file

abc0-file:
	perl -e 'printf "A\0B\0C\0"' > abc0-file

abc_-file:
	perl -e 'printf "A_B_C_"' > abc_-file

tsv-file.tsv:
	perl -e 'printf "f1\tf2\nA\tB\nC\tD\n"' > tsv-file.tsv

num30000:
	perl -e 'for(1..30000){print "$$_\n"}' > num30000

num1000000:
	perl -e 'for(1..1000000){print "$$_\n"}' > num1000000

num_%header:
	(echo %head1; echo %head2; perl -e 'for(1..10){print "$_\n"}') > num_%header

