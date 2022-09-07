#! /bin/bash
for i in `ls POSCAR-* | sed 's/POSCAR-//g'`
do
mkdir $i
cd $i
cp ../INCAR .
cp ../POTCAR .
cp ../KPOINTS . 
cp ../sub_vasp.job .
cp ../"POSCAR-"$i .
mv "POSCAR-"$i POSCAR
sed -i "s/phonopy/"phonopy-"$i/g" sub_vasp.job
bsub<sub_vasp.job
cd ..
done
