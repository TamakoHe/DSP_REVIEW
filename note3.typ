#set text(size: 15pt, font: ("Arial","Source Han Serif SC"))
#set heading(numbering: "1.")
#align(center)[#text(size: 25pt)[*傅立叶变换*]]
= DTFT的定义
$ X(e^(j omega))=sum_(n=-infinity)^infinity x[n]e^(-j omega n) $
$ sum_(n=-infinity)^infinity |x[n]|<infinity $
$ x[n]=1/(2pi) integral_(-pi)^pi X(e^(j omega))e^(j omega n) d omega $
== 常见的变化
$ delta[n]<-->^"DTFT" 1 $
$ a^n u[n]<-->^"DTFT(0<a<1)" 1/(1-a e^(-j omega))  $
== 性质
=== 线性性质
- 自变量:$omega$
- DTFT结果的周期:$2pi$
- 时移动:$x[n-n_0]<-->e^(-j omega n_0) X(e^(j omega))$
- 频移动:$e^(j omega_0 n)x[n]<-->X(e^(j (omega-omega_0)))$
e.g 求$x[n]=5 (1/2)^n u[n-1]$的DTFT
$ (1/2)^n u[n]<-->1/(1-0.5e^(-j omega)) $
$ (1/2)^(n-1) u[n-1]<-->e^(-j omega)/(1-0.5e^(-j omega)) "注意:所有n都要替换成n-1,别忘了那个指数" $
再乘以$5/2$就得到答案
=== 帕斯威尔定理(能量定理)
$ sum_(n=-infinity)^(+infinity) |x[n]|^2=1/(2pi) integral_(-pi)^pi |X(e^(j omega))|^2 d omega $
用频域的能量计算时域的能量
= 傅立叶变化的性质
== 复变函数基础
复数:$z=x+y j$
$ x=R_e (z) $
$ y=I_m (z) $
或者用极坐标表示
$ z=r e^(j theta) $
$ r=sqrt(x^2+y^2) $
$ theta=arctan(y/x) $
共轭:$z^*=x-y j$, $z^*=r e^(-j theta)$
== DTFT 其他性质
- 取反
$ x[-n]<-->X^(e^(-j omega)) $
- 共轭:
$ x^*[n]<--> X^*(e^(-j omega)) $
#image("image-5.png")
=== 序列的共轭对称部分和共轭反对称部分
$ x_e[n]=1/2 [x[n]+
x^*[-n]] $
$ x_o[n]=1/2 [x[n]-x^*[-n]] $
- 两个部分的傅立叶变换
$ x_e [n]<-->1/2 [X(e^(j omega))+X^* (e^(j omega))]=R_e [X(e^(j omega))] $
$ x_o [n]<-->1/2 [X(e^(j omega))-X^* (e^(j omega))]=j I_m [X(e^(j omega))] $
+ 共轭对称部分的傅立叶变换对应总傅立叶变换的虚部，共轭反变换对称对应的是傅立叶变换的虚部部分
+ 原信号实部的傅立叶变换对应总变换的共轭对称部分，原信号的虚部的傅立叶变换对应总变换的共轭反对称部分
#image("image-6.png")
对于实信号，其共轭对称和共轭反对称就是偶分量和奇分量，所以其偶分量的傅立叶变换
对应总变换的实部，实部是关于$omega$的偶函数，类似的，奇部是关于$omega$的奇函数

实信号的傅立叶变换的幅度是$omega$的偶函数，幅角是关于$omega$的奇函数