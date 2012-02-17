use strict;
use Test::More;
eval "use Test::Pod 1.00";
plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;
use File::Spec::Functions qw( catfile );

my $glob_path = catfile ( qw(2012/*.pod) );

foreach my $doc (glob $glob_path) {
    pod_file_ok($doc, $doc);
}

done_testing();

