package Finance::GeniusTrader::DateTime::1Min;

# Copyright 2000-2002 Rapha�l Hertzog, Fabien Fulhaber
# Copyright 2005 Jo�o Antunes Costa
# This file is distributed under the terms of the General Public License
# version 2 or (at your option) any later version.

use strict;
use vars qw();

use Finance::GeniusTrader::DateTime;
use Time::Local;

=head1 Finance::GeniusTrader::DateTime::1Min

This module treat dates describing a 1 minute period. They have the following format :
YYYY-MM-DD HH:NN:00

=cut
sub map_date_to_time {
    my ($value) = @_;
	my ($date, $time) = split / /, $value;
	$time = '00:00:00' unless (defined($time));
    my ($y, $m, $d) = split /-/, $date;
	my ($h, $n, ) = split /:/, $time;
    return timelocal(0, $n, $h, $d, $m - 1, $y - 1900);
}

sub map_time_to_date {
    my ($time) = @_;
    my ($sec, $min, $hour, $d, $m, $y, $wd, $yd) = localtime($time);
    return sprintf("%04d-%02d-%02d %02d:%02d:00", $y + 1900, $m + 1, $d, $hour, $min);
}

1;
