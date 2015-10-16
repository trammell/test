#!perl6

for '/usr/share/dict/words'.IO.words -> $word {
  say "$word probably rhymes with Perl"
    if $word ~~ /[ea?|u|i] rl $/;

  say "$word is a palindrome"
    if $word eq $word.flip;
}
