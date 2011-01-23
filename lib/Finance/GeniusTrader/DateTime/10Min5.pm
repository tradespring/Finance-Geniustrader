package Finance::GeniusTrader::DateTime::10Min5;

# Copyright 2000-2002 Raphaël Hertzog, Fabien Fulhaber
# Copyright 2005 João Antunes Costa
# This file is distributed under the terms of the General Public License
# version 2 or (at your option) any later version.

use strict;
use vars qw();

use Finance::GeniusTrader::DateTime;
use Time::Local;

=head1 Finance::GeniusTrader::DateTime::10Min

This module treat dates describing a 10 minute period. They have the following format :
YYYY-MM-DD HH:N0:00

=cut
sub map_date_to_time {
    my ($value) = @_;
	my ($date, $time) = split / /, $value;
    my ($y, $m, $d) = split /-/, $date;
	my ($h, $n, ) = split /:/, $time;
	if ($n <= 5) {$n=5}
	elsif ($n<=15) {$n=15}
	elsif ($n<=25) {$n=25}
	elsif ($n<=35) {$n=35}
	elsif ($n<=45) {$n=45}
	elsif ($n<=55) {$n=55}
	else {$n=5; ++$h}
    return timelocal(0, $n, $h, $d, $m - 1, $y - 1900);
}

sub map_time_to_date {
    my ($time) = @_;
    my ($sec, $min, $hour, $d, $m, $y, $wd, $yd) = localtime($time);
	if ($min <= 5) {$min=5}
	elsif ($min<=15) {$min=15}
	elsif ($min<=25) {$min=25}
	elsif ($min<=35) {$min=35}
	elsif ($min<=45) {$min=45}
	elsif ($min<=55) {$min=55}
	else {$min=5; ++$hour}
    return sprintf("%04d-%02d-%02d %02d:%02d:00", $y + 1900, $m + 1, $d, $hour, $min);
}

1;
