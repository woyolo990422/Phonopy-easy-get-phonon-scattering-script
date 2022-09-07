#! /bin/bash

#mkdir output
#cat tmp | xargs -i cp {}/vasprun.xml output/vasprun.xml-{}

mkdir output
for i in `ls POSCAR-* | sed 's/POSCAR-//g'`
do
cp $i/vasprun.xml output/"vasprun.xml-"$i
done
#temp1=`ls POSCAR-* | sed 's/POSCAR-//g'|head -n 1`
#temp2=`ls POSCAR-* | sed 's/POSCAR-//g'|tail -n 1`
#phonopy -f output/vasprun.xml-{$temp1..$temp2}
phonopy -f output/*
phonopy -s -p band.conf --tolerance=0.1
#./vasp_phpy_yaml_eigv.sh >frequency.dat
#phonopy -t mesh.conf
#./vasp_phpy_yaml_thermal.sh > filename.dat
