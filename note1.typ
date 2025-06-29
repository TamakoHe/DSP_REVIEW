#set text(size: 15pt, font: ("Arial","Source Han Serif SC"))
#set heading(numbering: "1.")
= 序列的表示
$ x[n]=sin(Omega n) $
$ x[n]={1,2,3,4} $
= 单位脉冲序列
$ delta[n]={...0,underline(1),0...} $
$ a delta[n-n_0] $
所有序列都可以表示为这个序列的加权位移之合
= 单位阶跃序列
$ u[n]={...0,1,1,1,1...} $
$ u[0]=1 $
= 单位矩形序列
$ R_N [n] $
0到N-1为1，其余的为0
= 实指数序列
$ x[n]=a^n u[n] $ 
= 复指数序列
$ x[n]=e^((sigma+j omega_0)n)=e^(sigma n) e^(j omega_0 n) $
$ e^(j omega_0 n)=cos(omega_0 n)+sin(omega_0 n)  $
= 正弦序列
$ x[n]=sin[omega_0 n] $
不一定时周期的  
=  数字周期序列
$ x[n]=x[n+N] $
数字序列的周期是一个整数  

对于正弦序列,$2pi/omega_0=P/Q$, 最简分数，$P$是最小正周期
$2pi/omega_0$如果是无理数，就没有周期。

多个正弦的组合就是找各个部分周期的最小公倍数。
= 尺度变换
$ x[n]->x[m n] $
$m$是正整数，那么每$m$个点抽取取样的值。


