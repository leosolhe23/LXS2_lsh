#!/bin/bash
REPORTE=reporte-`date +%Y%m%d`.log

echo  "Reporte generado por  $USER:"  >  $REPORTE

echo " " >>  $REPORTE
echo " " >>  $REPORTE

echo "########################################" >> $REPORTE
echo "#Interfaces disponibles en el servidor #"  >> $REPORTE
echo "########################################" >> $REPORTE

echo " " >>  $REPORTE

ifconfig >> $REPORTE


echo "########################################" >> $REPORTE
echo "# Puertos habilidatos en el servidor   #" >> $REPORTE
echo "########################################" >> $REPORTE


netstat -latun | grep LISTEN >> $REPORTE



echo "########################################" >> $REPORTE
echo "# Paso de variables por env             #" >> $REPORTE
echo "########################################" >> $REPORTE



echo "########################################" >> $REPORTE
echo "# Puertos habilidatos en el servidor   #" >> $REPORTE
echo "########################################" >> $REPORTE

echo "El contenido de \$MI_VAR es: $MI_VAR "
