#!/bin/bash

DATA=/home/sysadmin/Documents/problema2/hojasDatos
OUT_DATA=$DATA/archivos_csv
SUMARY=$DATA/archivos_resumen

mkdir $OUT_DATA
mkdir $SUMARY

mes=1
# convertir los xls a archivos csv
for i in `find $DATA -name '*.xls'`
do
#	echo "Procesando archivo $i"
	xls2csv $i > $OUT_DATA/luz-$mes.csv
	let mes=mes+1
done 2> error1.log


#borrado para evitar que el archivo crezca por cada vez que corra el script
#Se verifica si el archivo ya existe y de ser verdadero se borra para evitar
#que el archivo crezca cada vez que corra el script
if [ -a $SUMARY/luz-totales.dat ]
then
	rm $SUMARY/luz-totales.dat
        rm $SUMARY/agua-totales.dat

fi 2> errorIf.log

m=1

for e in `find $OUT_DATA -name "*.csv"`
do
      	echo -n $m " " >> $SUMARY/luz-totales.dat	
      	cat $e | grep "Luz" | cut -d "," -f2 | sed 's/"//' | sed 's/"/ /'  >> $SUMARY/luz-totales.dat

	echo -n $m " " >> $SUMARY/agua-totales.dat
      	cat $e | grep "Agua" | cut -d "," -f2 | sed 's/"//' | sed 's/"/ /'  >> $SUMARY/agua-totales.dat
       
	let m=m+1
done     
2> error2.log

graficar()
{       echo "**************** GRAFICANDO!! ********************"
	gnuplot << EOF ; 2>error.log
	
	set title "Grafico consumo electrico y agua"
        set xlabel "Meses"
	set ylabel "Monto"	
	set xrange ["0" : "6"]
      	set x2range ["0" : "3"]
        set yrange ["7000" : "60000" ]
        set y2range ["7000" : "60000" ]
	set terminal png
	set output 'consumo-luz-agua.png'
        plot "$SUMARY/luz-totales.dat"  axes x2y1 with lines title "Consumo Luz", "$SUMARY/agua-totales.dat"  axes x1y1 with lines title "Consumo Agua"

EOF
}
graficar

