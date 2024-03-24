#!/bin/bash
# A script that launches gnuplot on the file result.dat
#
# you can also launch gnuplot and type the command at the gnuplot prompt
#

gnuplot --persist <<EOF
set title "Plot"
set xlabel "Time [day]"
set ylabel "Dry Weight"
plot "plotDW.txt" using 1:2 with lines title "NSDW", "plotDW.txt" using 1:3 with lines title "SDW"
pause -1
EOF
