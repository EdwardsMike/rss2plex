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

my $url	= $xml->{ channel }->{ item }[0]->{ enclosure }->{ url }; 

#print Dumper $xml;
print $url;

