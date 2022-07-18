#!/usr/bin/perl
#
# Purpose:	grok the RSS feed from Floydpodcast.com, get
#			the latest available download unless it
#			has already been downloaded
# Usage: curl -s [URL] | ./parse_feed.pl | wget ... 
# TODO:		Do all the curl and wget stuff in one Perl script

use strict;
use warnings;
use Getopt::Long;
use XML::Simple;
use Data::Dumper;

$|++;

my $in	= $ARGV[0];
my $xml	= XMLin( $in );
my $number_of_shows = 1;

my @URLS;
for ( my $i = 0; $i < $number_of_shows; $i++ ) {
    push @URLS, $xml->{ channel }->{ item }[$i]->{ enclosure }->{ url };
}    

#print Dumper $xml;
print $URLS[0];

