package Finance::GeniusTrader::DateTime::30Min15;

# Copyright 2000-2002 Rapha�l Hertzog, Fabien Fulhaber
# Copyright 2005 Jo�o Antunes Costa
# This file is distributed under the terms of the General Public License
# version 2 or (at your option) any later version.

use strict;
use vars qw();

use Finance::GeniusTrader::DateTime;
#ALL# use Log::Log4perl qw(:easy);
use Time::Local;

=head1 Finance::GeniusTrader::DateTime::30Min15

This module treat dates describing an half-hour cutting at 15 and 45 minute of each hour. They have the following format :
YYYY-MM-DD HH:N5:00

=cut
sub map_date_to_time {
    my ($value) = @_;
	my ($date, $time) = split / /, $value;
    my ($y, $m, $d) = split /-/, $date;
	my ($h, $n, ) = split /:/, $time;
    if    ($n >= 45) { $n=45 }
    elsif ($n >= 15) { $n=15 }
    else  { $n = 45, $h-- };

    if ($h < 0) {
        $h = 23;
        --$d;
    }
    return timelocal(0, $n, $h, $d, $m - 1, $y - 1900);
}

sub map_time_to_date {
    my ($time) = @_;
    my ($sec, $min, $hour, $d, $m, $y, $wd, $yd) = localtime($time);
    if ($min>=45) {$min=45;} elsif ($min >=15) { $min = 15 }
    else {$min = 45, $hour--;}
    return sprintf("%04d-%02d-%02d %02d:%02d:00", $y + 1900, $m + 1, $d, $hour, $min);
}

1;
