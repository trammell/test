#!/usr/bin/perl

package main;
use strict;
use warnings FATAL => 'all';
use Test::More 'no_plan';

my $x = require('truncate.pl');
warn $x;
die $@ if $@;

#    2.1, 2.01, 2.001, 2.0001, 2.00001, 0.2000001,
#    1.9, 1.99, 1.999, 1.9999, 1.99999, 1.9999999,

my @tests = (
    1.9 => 1.9,
    1.99 => 1.99,
    1.999 => 1.999,
    1.9999 => 1.9999,
    2.1 => 2.1,
    2.01 => 2.01,
    2.001 => 2.001,
    2.0001 => 2.0001,
    -31.670000000000002 => -31.67,
    0.050000000000000003 => 0.05,
    1.4099999999999999 => 1.41,
    0.10000000000000001 => 0.1,

    38.159999999999997 => 38.16,
    63.329999999999998 => 63.33,

    6.8200000000000003 => 6.82,
    5.7400000000000002 => 5.74,
    7.8099999999999996 => 7.81,
    8.3499999999999996 => 8.35,
    5.1500000000000004 => 5.15,
    6.1600000000000001 => 6.16,
    7.7199999999999998 => 7.72,
    8.4399999999999995 => 8.44,
    8.5999999999999996 => 8.6,
    8.3499999999999996 => 8.35,
    10.300000000000001 => 10.3,

    12.359999999999999 => 12.36,
    3802.1100000000001 => 3802.11,
    18.399999999999999 => 18.4,
    60.630000000000003 => 60.63,
    96.340000000000003 => 96.34,
);

while (@tests) {
    my $bad = shift(@tests);
    my $fixed = shift(@tests);
    is(trunc($bad), $fixed, "$bad => $fixed");
}

__END__

              239800 |                    1
              219000 |                    1
              243680 |                    1
              359700 |                    1
                3.25 |                    1
                 145 |                    1
             1630435 |                    1
                 3.5 |                    1
               20.25 | 0.050000000000000003
             1704545 |                    1
             1785714 |                    1
                 429 |                    1
                 123 |                    1
                3.75 |                    1
                6998 |                    1
                6397 |                    1
                6180 |                    1
               12793 |                    1
                1.52 |  0.10000000000000001
                1.49 |  0.10000000000000001
  1.4099999999999999 |  0.10000000000000001
                1.28 |  0.10000000000000001
  6.3499999999999996 | 0.050000000000000003
  7.5599999999999996 | 0.050000000000000003
  85.069999999999993 | 0.050000000000000003
           100098223 |                    1
               12250 |                    1
                1.45 | 0.050000000000000003
                1560 |                    1
               22.91 | 0.050000000000000003
           200033556 |                    1
               16500 |                    1
               11455 |                    1
                8380 |                    1
               14360 |                    1
               12483 | 0.050000000000000003
                2983 |                    1
                5070 |                    1
                3841 |                    1
 0.98999999999999999 | 0.050000000000000003
                1.25 | 0.050000000000000003
                14.5 | 0.050000000000000003
               13.42 | 0.050000000000000003
               33.18 | 0.050000000000000003
                  32 | 0.050000000000000003
  120.65000000000001 | 0.050000000000000003
  97.819999999999993 | 0.050000000000000003
  87.340000000000003 | 0.050000000000000003
           100098745 |                    1
           100145543 |                    1
               13500 |                    1
               12500 |                    1
              143000 |                 0.05
  2.0499999999999998 | 0.050000000000000003
                7614 |                    1
               11.74 | 0.050000000000000003
                 367 |                    1
  11.800000000000001 | 0.050000000000000003
  9.3000000000000007 | 0.050000000000000003
               12.07 | 0.050000000000000003
               10.44 | 0.050000000000000003
                1591 |                    1
  11.949999999999999 | 0.050000000000000003
                 320 |                    1
                7.46 | 0.050000000000000003
  6.5499999999999998 | 0.050000000000000003
                5967 |                    1
  25.699999999999999 | 0.050000000000000003
  9.5999999999999996 | 0.050000000000000003
  83.900000000000006 | 0.050000000000000003
  80.799999999999997 | 0.050000000000000003
  9.5999999999999996 | 0.050000000000000003
  13.800000000000001 | 0.050000000000000003
  174.56999999999999 | 0.050000000000000003
  5.6200000000000001 |                 0.01
                1800 |                    1
  86.200000000000003 | 0.050000000000000003
  91.200000000000003 | 0.050000000000000003
                  15 | 0.050000000000000003
  12.699999999999999 | 0.050000000000000003
  18.800000000000001 | 0.050000000000000003
              797000 |                    1
              844500 |                    1
              947000 |                    1
               15300 |                    1
              142500 |                    1
              280000 |                    1
  7.2999999999999998 | 0.050000000000000003
                  18 | 0.050000000000000003
                   5 | 0.050000000000000003
  4.4000000000000004 | 0.050000000000000003
  7.9400000000000004 | 0.050000000000000003
  7.2199999999999998 | 0.050000000000000003
  9.0199999999999996 | 0.050000000000000003
  8.1500000000000004 | 0.050000000000000003
  50.490000000000002 |                 0.01
               13.49 |                 0.01
              812000 |                    1
               25300 |                    1
               14500 |                    1
  5.6200000000000001 |                 0.01
                14.4 | 0.050000000000000003
                22.5 | 0.050000000000000003
  19.699999999999999 | 0.050000000000000003
  4.7999999999999998 | 0.050000000000000003
  44.200000000000003 |                 0.01
               14700 |                    1
  7.0099999999999998 |                 0.01
              -11.84 | 0.050000000000000003
  2.7000000000000002 | 0.050000000000000003
  3.9300000000000002 | 0.050000000000000003
  8.1500000000000004 | 0.050000000000000003
  8.4299999999999997 | 0.050000000000000003
  6.1699999999999999 | 0.050000000000000003
  8.0399999999999991 | 0.050000000000000003
  8.4299999999999997 | 0.050000000000000003
  9.0800000000000001 | 0.050000000000000003
  50.490000000000002 |                 0.01
                1.05 |                 0.01
  2.0800000000000001 |                 0.01
  1.1000000000000001 |                 0.01
  1.0700000000000001 |                 0.01
                  37 |                    1
                  62 |                    1
                  26 |                    1
                  18 |                    1
                 1.5 | 0.050000000000000003
                   4 | 0.050000000000000003
                   2 | 0.050000000000000003
  4.2000000000000002 | 0.050000000000000003
                 6.5 | 0.050000000000000003
                  15 | 0.050000000000000003
  13.699999999999999 | 0.050000000000000003
  6.2999999999999998 | 0.050000000000000003
  13.699999999999999 | 0.050000000000000003
                30.5 | 0.050000000000000003
  13.800000000000001 | 0.050000000000000003
  13.699999999999999 | 0.050000000000000003
  8.3000000000000007 | 0.050000000000000003
                1441 |                    1
               12423 |                    1
               -3674 |                    1
                  25 | 0.050000000000000003
               12423 |                    1
               26103 |                    1
               26103 |                    1
               74800 |                    1
             9810726 |                    1
               41000 |                    1
               71800 |                    1
                   3 | 0.050000000000000003
  6.5999999999999996 | 0.050000000000000003
  6.7999999999999998 | 0.050000000000000003
                   8 | 0.050000000000000003
  4.9000000000000004 | 0.050000000000000003
  7.2199999999999998 | 0.050000000000000003
               56893 |                    1
                9248 |                    1
               71800 |                    1
               10.44 |  0.10000000000000001
               12.07 |  0.10000000000000001
  12.359999999999999 |  0.10000000000000001
  3802.1100000000001 | 0.050000000000000003
  18.399999999999999 | 0.050000000000000003
  60.630000000000003 | 0.050000000000000003
  96.340000000000003 | 0.050000000000000003
  10.279999999999999 |  0.10000000000000001
  37.200000000000003 | 0.050000000000000003
  49.600000000000001 | 0.050000000000000003
                  15 | 0.050000000000000003
 -23.789999999999999 | 0.050000000000000003
  11.199999999999999 | 0.050000000000000003
  18.800000000000001 | 0.050000000000000003
  21.800000000000001 | 0.050000000000000003
  28.899999999999999 | 0.050000000000000003
  69.799999999999997 | 0.050000000000000003
  70.799999999999997 | 0.050000000000000003
  3.7999999999999998 |  0.10000000000000001
                1300 |                    1
               72222 |                    1
               36111 |                    1
  12.789999999999999 | 0.050000000000000003
  9.3499999999999996 | 0.050000000000000003
  9.6899999999999995 | 0.050000000000000003
  100.59999999999999 | 0.050000000000000003
               109.7 | 0.050000000000000003
  7.0999999999999996 |  0.10000000000000001
  5.4000000000000004 |  0.10000000000000001
                10.5 |  0.10000000000000001
                1950 |                    1
             9880246 |                    1
             9892760 |                    1
  12.029999999999999 | 0.050000000000000003
  9.8800000000000008 | 0.050000000000000003
                5350 |                    1
                 450 | 0.050000000000000003
              140000 |                    1
             9824630 |                    1
               69149 |                    1
                 350 |                    1
                2350 |                    1
              343750 |                    1
                  55 | 0.050000000000000003
              213836 |                    1
               77778 |                    1
                 438 |                    1
                 143 | 0.050000000000000003
                 100 | 0.050000000000000003
             1739130 |                    1
                 235 | 0.050000000000000003
              113836 |                    1
              113707 |                    1
              123965 |                    1
  3.3300000000000001 |                    1
  6.0999999999999996 | 0.050000000000000003
             3726.27 | 0.050000000000000003
  6.2199999999999998 | 0.050000000000000003
 0.57999999999999996 |                 0.01
  5.5499999999999998 | 0.050000000000000003
  4.5199999999999996 |                 0.01
              675990 |                    1
              860130 |                    1
                3950 | 0.050000000000000003
  3488.6399999999999 | 0.050000000000000003
  1.1499999999999999 | 0.050000000000000003
              668990 |                    1
              661290 |                    1
  38.159999999999997 | 0.050000000000000003
  63.329999999999998 | 0.050000000000000003
 -31.670000000000002 | 0.050000000000000003
  6.8200000000000003 | 0.050000000000000003
  5.7400000000000002 | 0.050000000000000003
  7.8099999999999996 | 0.050000000000000003
  8.3499999999999996 | 0.050000000000000003
  5.1500000000000004 | 0.050000000000000003
  6.1600000000000001 | 0.050000000000000003
  7.7199999999999998 | 0.050000000000000003
  8.4399999999999995 | 0.050000000000000003
  8.5999999999999996 | 0.050000000000000003
  8.3499999999999996 | 0.050000000000000003
  10.300000000000001 | 0.050000000000000003
               14.44 | 0.050000000000000003
  6.6399999999999997 | 0.050000000000000003
  6.7000000000000002 | 0.050000000000000003
                6.71 | 0.050000000000000003

