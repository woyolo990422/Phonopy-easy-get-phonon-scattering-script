# Vasp Phonopy easy get phonon scattering script
very easy to get phonon scattering
######简介######

1.本方法使用phonopy的有线位移法计算，band.conf为额外的必须文件,具体的tag需要去phonopy官网查看

2.明确需要计算的体系大小，如果unitcell很大，酌情扩胞，一般总原子数控制在500以内，并且多电子体系计算更慢

3.使用方法：

首先获得高精度优化后的POSCAR

扩胞： phonopy -d --dim="x x x" -c POSCAR --tolerance=(0.001~1) (tolearance代表了空间群的判断容忍误差，对于敏感的结构取不同值有较大的区别，-c 为选取扩胞文件， --dim为扩胞的周期)

计算：sh loop-in.sh

结果分析： sh loop-out.sh 其中band.pdf为声子散射结果

PS:

由于并行提交任务计算，该方法比VASP的DFPT法获得声子谱计算更快，在资源充足的情况下很好用

如果出现虚频结构不稳定，可以通过更改空间群判断容忍误差或者使用更大的胞去尽量去掉虚频，比如结构在0 0 0的Γ处有虚频，往往是需要各个方向上都增大超胞的周期数，而比如其他点处有虚频，比如0.5 0.5 0点处有虚频，则可以选择增大 dim种前两个方向的超胞周期数，like this：2 2 2 -->> 4 4 2 尽量使结构扩胞后轴长度相近

该方法计算的声子只是0K下的结果，如果体系对于非谐效应敏感，则需要使用Dynaphopy来重整化有限温度下的力常数，或许会导致声子硬化，原有的虚频消失

设置FORCE_CONSTANTS=WRITE可以获得FORCE_CONSTANTS文件(二阶力常数),便于继续使用ShengBTE配合thirdorder来计算热导率等性质
