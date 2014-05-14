#!/usr/bin/perl

use strict;
use warnings;

package MyParser;
use base qw(HTML::Parser);

# This parser only looks at opening tags
sub start {
    my ($self, $tagname, $attr, $attrseq, $origtext) = @_;
    if ($tagname eq 'img') {
        if ($attr->{ style }) {
            if ($attr->{ style } ne "display:block;") {
                print "should change style\n";
            }
        } else {
            print "add style\n";
        }

        if ($attr->{ border }) {
            if ($attr->{ border } ne "0") {
                print "should change border\n"
            }
        } else {
            print "should add border\n"
        }
    }

}

package main;

my $parser = MyParser->new;
$parser->parse_file('index.html');

__END__
