package Finance::GeniusTrader::TradeFilters::AcceptAll;

# Copyright 2000-2002 Rapha�l Hertzog, Fabien Fulhaber
# This file is distributed under the terms of the General Public License
# version 2 or (at your option) any later version.

# Standards-Version: 1.0

use strict;
use vars qw(@NAMES @ISA @DEFAULT_ARGS);

use Finance::GeniusTrader::TradeFilters;

@NAMES = ("AcceptAll");
@ISA = qw(Finance::GeniusTrader::TradeFilters);
@DEFAULT_ARGS = ();

=head1 NAME

Finance::GeniusTrader::TradeFilters::AcceptAll - Accept all trades

=head1 DESCRIPTION

TradeFilter accepting all trades.

=cut

1;
