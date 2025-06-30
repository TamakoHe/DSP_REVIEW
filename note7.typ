#set text(size: 15pt, font: ("Arial","Source Han Serif SC"))
#set heading(numbering: "1.")
#align(center)[#text(size: 25pt)[*滤波器*]]
= 滤波器分类
+ 低通
+ 高通
+ 带通
= Butterworth filter
特沃斯滤波器的核心特点是其频率响应在通带内尽可能平坦
#image("image-45.png")
Chebyshev filter and Elliptic filter
== 幅频响应和关键参数
#image("image-48.png")
注意$Omega_c$, 3db点

响应函数时全极点型的
== N 值 
#figure(caption: [阶数N不会改变$Omega_c$])[#image("image-49.png")]
会有N个极点，只取左半平面的极点 
== exp 
#image("image-50.png")
- 确定N值
$ K_"sp"=sqrt((10^(0.1 alpha_s)-1)/(10^(0.1 alpha_p)-1))=41.3223 $
$ lambda_"sp"=f_s/f_p=2.4 $
$ N=(lg K_"sp")/(lg lambda_"sp")=4.25 $
向上取整,$N=5$.  
- 查表
#figure(caption: [查表得到归一化原型系统函数])[#image("image-51.png")]
- 计算$Omega_c$
$ Omega_c=Omega_p (10^(0.1 alpha_p)-1)^(-1/(2N))=5.275 "kHz" $
用Hz表示哦！！ 
- $p=s/(Omega_c) "hz"$
== exp2 直接带入
#image("image-52.png")
= 数字滤波器
== 采样 
采样的参数 
$ T_s=1/f_s=(2pi)/Omega_s $
$ x(t)=A cos(2pi f t)->x[n]=A cos(2pi f T_s n) $
新的频率$2pi f T_s$, $omega("数字频率")=Omega("模拟频率") T_s=2pi f/f_s$
只有把数字频率乘以采样频率，才能得到实际的模拟频率
数字采样频率:$omega_s=Omega_s T_s=2pi$

对于满足采样定理的情况，数字频率$pi$对应带限信号模拟频率的最大值 
== 数字低通滤波器
#figure(caption: [靠近0,$2pi$是低频])[#image("image-53.png")]
#figure(caption: [对比模拟滤波器和数字滤波器])[#image("image-54.png")]
可以带入$omega=0,omega=pi,omega=pi/2$来判读是哪种滤波器
= 设计数字滤波器
== 分类
+ IIR 无限长单位脉冲响应数字滤波器
  #figure(caption: [IIR的系统函数 由分母决定 N阶IIR滤波器])[#image("image-55.png")]
+ FIR 有限长单位脉冲响应数字滤波器(用于线性相位滤波)
  $ H[z]=sum_(n=0)^(N-1) h[n]z^(-n) $
  N-1阶FIR滤波器
== 间接法设计IIR滤波器
先设计模拟滤波器$H_a(s)$,然后转换为数字滤波器$H[z]$

怎么转换？
=== 脉冲响应不变法 
#image("image-56.png")
关键把s平面的左半平面的极点映射到z平面单位圆内？

关键$z=e^(s T)$z变换和拉普拉斯变换的关系
- exp 
转换:$ H_a(s)=1/(s+0.9) $

极点:$s_1=-0.9$->$z=e^(- 0.9 T)$

则，其z域系统函数:$1/(1-0.9^(-0.9 T)z^(-1))$
#figure(caption: [基本转换方法])[#image("image-57.png")]

$T$是采样间隔，默认可以认为是1 
#figure(caption: [避免T太小的时候$abs(H(e^(j omega)))$的值过大])[#image("image-58.png")]
- exp2
#image("image-59.png")
+ 把数字频率的要求转换为模拟频率的要求$times f_s$
  $ Omega_p=omega_p/T=(0.2pi)/T $
  $ Omega_s=omega_s/T=(0.315pi)/T $
+ 确定阶数+查表 
#image("image-60.png")
+ 分解分式，计算$Omega_c$和$H$
#image("image-61.png")
+ 转换
#image("image-62.png")
- exp3 
转换:
$ H_a(s)=1/(2s^2+3s+1) $
$ H_a(s)=1/2 [1/(s+1/2)-1/(s+1)] $
$ s_1=-1/2,s_2=-1 $
$ H[z]=1/2 [T/(1-e^(-0.5T)z^(-1))-T/(1-e^(-T)z^(-1))] $
$ T=1 $
$ H(z)=(1/2)/(1-0.61z^(-1))-(1/2)/(1-0.37z^(-1)) $
=== 双线性变换法
#figure(caption: [对单位冲激响应采样，采样结果的频谱形成了周期，幅度变为$1/T$])[#image("image-63.png")]
#figure(caption: [因为信号无法做到严格带限导致混叠失真的例子])[#image("image-64.png")]
脉冲响应不变法只能设计低通滤波器，而且只能用于严格的带限信号，而且要保证系统函数能够被因式分解
#figure(caption: [基本思路])[#image("image-65.png")]
#image("image-66.png") 
右边的那个公式把原先的要求的频率进行一个转换
- exp4 
#figure(caption: [先对频率要求进行转换])[#image("image-67.png")]
#figure(caption: [设计模拟滤波器])[#image("image-68.png")]
#figure(caption: [$s->(1-z^(-1))/(1+z^(-1))$])[#image("image-69.png")]
= 频率变换法设计高通滤波器
== 四个参数($alpha_s>alpha_p$)
#image("image-70.png")
== 把高通转低通
#image("image-72.png")
= 设计带通滤波器
== 带通滤波器的指标
#image("image-74.png")
#image("image-75.png")
= IIR滤波器的网络结构
== 直接型I框图结构
#figure(caption: [$x[n][b_0+b_1 z^(-1)+b_2 z^(-2)+...+b_M z^(-M)]+y[n](-a_1 z^(-1)-a_2 z^(-2)-...-a_N z^(-N))=y[n]$])[#image("image-77.png")]
== 直接II型 
#figure(caption: [直接II型])[#image("image-78.png")]
== 拆分分式之后
#figure(caption: [拆分分式之后组成并联型])[#image("image-79.png")]

