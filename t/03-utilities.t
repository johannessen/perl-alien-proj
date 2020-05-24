use strict;
use warnings;
use Test::More;
use Test::Alien;
use Alien::proj;
use File::Which qw /which/;

UTILITY:
{
    local $TODO = 'not all system installs have utilities'
      if Alien::proj->install_type eq 'system'
        && !which 'projinfo';
    
    my ($result, $stderr, $exit) = Alien::proj->run_utility ("projinfo");
    like ($stderr, qr{Rel. \d\.\d\.\d, .+ \d{4}},
        'Got expected result from projinfo utility');
    diag '';
    diag ("\nUtility results:\n" . $result);
    diag ($stderr) if $stderr;
    diag "Exit code is $exit";
    diag '';
    diag (Alien::proj->bin_dirs);
}

done_testing();

