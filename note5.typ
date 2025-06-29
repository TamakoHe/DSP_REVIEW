#set text(size: 15pt, font: ("Arial","Source Han Serif SC"))
#set heading(numbering: "1.")
#align(center)[#text(size: 25pt)[*离散傅立叶变换(DFT)*]]
技术背景:计算机处理的需要
= 定义 
== DFT 
$ X[k]=sum_(n=0)^(N-1) x[n] W_N^(n k) $
$ x[n]=1/N sum_(k=0)^(N-1) X[k] W_N^(-n k) $
$N$:称为N点DFT 
$ W_N^(n k)=e^(-j (2pi)/N n k) $ 
- exp1 
求$delta[n]$的4点DFT:\
$ X[k]=sum_(n=0)^3 delta[n] W_4^(n k)=1 $
== 周期延拓
$x((n))_N$:以$N$为周期的周期延拓函数

理论上，只有周期序列的才能有离散的频谱，所以对于非周期序列($x[n]$的隐含周期)

- M:原长度
- N:延拓后的周期N 
#figure(caption: [序列长度和延拓的周期相等，直接不断重复])[#image("image-25.png")]
#figure(caption: [序列长度小于延拓周期，每个周期后面补0])[#image("image-26.png")]
#figure(caption: [序列长度大于延拓周期，会产生混叠])[#image("image-27.png")]
- 还原:
#figure(caption: [主值序列是从0开始的第一个周期])[#image("image-28.png")]
主值序列不一定是原来的序列，是延拓后的序列取0开始的第一个周期的结果，只有$N=M$才和
原序列相等

不重叠的情况下:$x((M))_N=x(M mod N)$
- $X[k]$的隐含周期
#figure(caption: [实质是离散傅立叶级数系数])[#image("image-29.png")]
$X[k]$是$tilde(X)[k]$的主值序列 
== 周期序列
对于无限长度的周期序列，无法求在所有点上DFT，于是在一个周期0到N-1求DFT
#figure(caption: [周期信号的傅立叶级数])[#image("image-30.png")]
== 旋转因子 
把单位圆平均分成N份，不断旋转，形成复平面上的点们
#figure(caption: [逆时针旋转])[#image("image-31.png")]
= DFT点性质
== 线性 
#figure(caption: [对于不一样的长度的序列， DFT的点数要取最长的序列才能体现线性])[#image("image-32.png")]
- exp1 
$x_1[n]=R_4 [n]$,$x_2[n]=R_2[n]$

求$y[n]=3x_1[n]+x_2[n]$的4点DFT 

$R_4[n]$的四点DFT:$X_1[k]={4,0,0,0}$

$R_2[n]$的四点DFT:$sum_(n=0)^3 R_2[n]e^(-j 2pi/4 n k)={2,1-j,0,1+j}$
$ Y[k]={14,1-j,0,1+j} $
== 循环移位特性
=== 定义
#image("image-33.png")
用这种方法可以比较方面的找出循环以为的结果
=== 循环移位定理
左循环位移m个点，DFT变为:
$ Y[k]=W_N^(-m k)X[k] $
- 频域循环位定理 
#image("image-34.png")
频域循环左移$l$个点，时域乘以$W_N^(n l)$
== 循环卷积定理
对于两个序列$x_1[n]$,$x_2[n]$, 长度分别为$M_1$和$M_2$, 取循环卷积长度 
$L>=max[M_1,M_2]$
- $X_1[k]$是$x_1[n]$的L点DFT 
- $X_2[n]$是$x_2[n]$的L点DFT 
则:\
$ y[n]=x_1[n] circle.filled x_2[n]<-->Y[n]=X_1[k]X_2[k] $
=== 循环卷积的定义 
$ y[n]=x_1[n] circle.filled x_2[n]=sum_(m=0)^(L-1)[x_1[m]x_2((n-m)_L)]R_L[n] $
#figure(caption: [对比两种卷积])[#image("image-35.png")]
- exp1 
  $ x_1[n]={1,1,1,1}, x_2[n]={1,2,3,4} $
  分别求4点和8点循环卷积
  - 4点
    $ [sum_(m=0)^3 x_1(m) x_2((n-m))_4]R_4(n) $
    #figure(caption: [构造一个循环矩阵，首先写出取反+周期延拓的结果， 然后取主值序列，然后右移，取主值序列])[#image("image-36.png")]
    #figure(caption: [构造出来的循环矩阵])[#image("image-37.png")]
  - 8点
    #figure(caption: [8点矩阵])[#image("image-38.png")]
= 复共轭的DFT 
$x^*[n]$是$x[n]$的共轭序列，长度为N 
$ x[n]<-->X[k] $
$ x^*[n]<-->X^*[N-k] $
$ X[N]=X[0] $
#figure(caption: [exp:复共轭的DFT])[#image("image-41.png")]
= DFT的共轭对称性
#image("image-42.png")
#figure(caption: [例子，实序列由奇求偶，由偶求奇])[#image("image-43.png")]
= 频率域采样定理 
如果$x[n]$的长度为M, 则只有当频域采样点数$N>=M$时候才能把$X[k]$恢复为$x[n]$
$ x_N[n]="IDFT"X[k]=x[n] $
- exp1
#image("image-44.png")
先求周期延拓后的主值序列，然后进行IDFT得到${2,2,3,4,5,4,3,2}$
