#!/usr/bin/env perl

# based on https://github.com/chromatic/modern_perl_book

use strict;
use warnings;

use File::Spec::Functions qw( catfile );

my @docs = get_docs();

require App::pod2pdf
    or die "pod2pdf is not present in your PATH; please install App::pod2pdf\n";


foreach my $doc (@docs) {
    my $pdf = $doc;
    $pdf =~ s/pod$/pdf/g;
    print "Converting $doc to $pdf\n";
    system( 'pod2pdf', '--noheader', $doc, '--output-file', $pdf );
}

sub get_docs 
{
    my $glob_path = catfile ( qw(2012/*.pod) );
    return glob $glob_path;
}

