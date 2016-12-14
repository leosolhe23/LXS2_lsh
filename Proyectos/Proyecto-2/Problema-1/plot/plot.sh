#!/bin/bash

FMT_BEGIN="20110206 0000"
FMT_END="20110206 0200"
FMT_X_SHOW=%H:%M


graficar()
{
	gnuplot << EOF ; 2>error.log
	set xdata time
	set timefmt "%Y%m%d %H%M"
	set xrange ["$FMT_BEGIN" : "$FMT_END"]
        set format x "$FMT_X_SHOW"
	set terminal png
	set output 'fig1.png'
       	plot "graf-3.dat" using 1:3 with lines title "sensor1", "graf-3.dat" using 1:4 with linespoints title "sensor2"
EOF
}

graficar
