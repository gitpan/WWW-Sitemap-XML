use strict;

BEGIN {
    eval "use $ARGV[0]";
    die $@ if $@;
}

my $class = $ARGV[0];

$|=1;

my $url_count = 40000;
my $sleep_time = 15;

print "Creating URLs...\n";
my @urls;
for (my $i=0; $i<$url_count; $i++) {
    push(@urls, "http://www.example.com/subdir/page$i.html");
}
print "Sleeping1...\n";
sleep($sleep_time);

print "Adding URLs to Sitemap...\n";
my $map = $class->new();
foreach my $url (@urls) {
    $map->add({
        loc => $url,
        lastmod => time(),
    });
}

print "Sleeping2...\n";
sleep($sleep_time);

print "Writing Sitemap...\n";
$map->write('sitemap.xml', 1);
print "Sleeping3...\n";
sleep($sleep_time);

print "Quitting...\n";

