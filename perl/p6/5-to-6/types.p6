my Int $x = 3;
#$x = "foo";         # error
say $x.WHAT;        # '(Int)'

# check for a type:
if $x ~~ Int {
    say '$x contains an Int'
}
