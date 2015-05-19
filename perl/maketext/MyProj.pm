package MyProj;
use strict;
use warnings FATAL => 'all';

{
    package MyProj::Loc;
    use base 'Locale::Maketext';
}

{
    package MyProj::Loc::en;
    use base 'MyProj::Loc';
    our %Lexicon = (_AUTO => 1);
}

{
    package MyProj::Loc::fr;
    use base 'MyProj::Loc';
    our %Lexicon = (
        "[quant,_1,correct answer]" =>
            "[quant,_1,réponse exacte,réponses exactes]"
    );
}

{
    package MyProj::Loc::de;
    use base 'MyProj::Loc';
    our %Lexicon = (
        "apple" => "Apfel",
        "[quant,_1,year] old!" => "[quant,_1,Jahre,Jahre] alt!",
    );

    sub quant {
        my $lang = shift;
        warn __PACKAGE__ . "::quant >>> @_";
        return $lang->SUPER::quant(@_);
    }

}

# make this a modulino
MyProj->run(@ARGV) unless caller();

sub run {
    my $en = MyProj::Loc->get_handle('en') or die "What language?";
    warn $en->language_tag(), " ", $en->encoding();
    warn $en->maketext("apple");
    warn $en->maketext("[quant,_1,year] old!", 1);
    warn $en->maketext("[quant,_1,year] old!", 2);
    warn $en->maketext("[quant,_1,correct answer]", 1);
    warn $en->maketext("[quant,_1,correct answer]", 2);

    my $de = MyProj::Loc->get_handle('de') or die "What language?";
    warn $de->maketext("apple");
    warn $de->maketext("[quant,_1,year] old!", 1);
    warn $de->maketext("[quant,_1,year] old!", 2);

    my $fr = MyProj::Loc->get_handle('fr') or die "What language?";
    warn $fr->maketext("[quant,_1,correct answer]", 1);
    warn $fr->maketext("[quant,_1,correct answer]", 2);
}

1;


