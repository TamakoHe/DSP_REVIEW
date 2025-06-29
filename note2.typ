#set text(size: 15pt, font: ("Arial","Source Han Serif SC"))
#set heading(numbering: "1.")
= 序列的线性卷积和
$ y[n]=x_1[n]*x_2[n]=sum_(m=-infinity)^infinity x_1[m] x_2[n-m] $
$x_2[n-m]$是对应y轴反转后，右移$n$个单位
#image("image.png")
= 规律
交换律，结合律，分配律
#image("image-1.png")
= 单位脉冲序列的卷积性质
$ x[n]*delta[n-n_0]=x[n-n_0] $
造成了时移
== e.g 
$ y[n]=u[n-3]*u[n-4]=u[n]*delta[n-3]*u[n]*delta[n-4]=u[n]*u[n]*delta[n-3]*delta[n-4]=[(n+1)u[n]]*delta[n-7]=(n+1-7)u[n-7]=(n-6)u[n-7] $
= 系统的分类
$ y[n]=T[x[n]] $
- $y[n]$:输出
- $x[n]$:输入
- $T{.}$:运算
== 线性:
- 可加性
- 比例性
== Time-invariant(时不变)
$ y[n]=T[x[n]]->y[n-n_0]->T[x[n-n_0]] $
= LTI 线性时不变系统
== LTI系统的响应的组成
可以记为:
$ y[n]=x[n]+b $
+ $y_"zs"[n]$ 仅由输入序列在0时刻之后的响应
+ $y_"zi"[n]$ 由初始状态引起的响应
全响应:$y_"zs"[n]+y_"zi"[n]$\
单位脉冲响应:$h[n]$\
输入$2delta[n-1]$,输出$2h[n-1]$\
*重要公式*
$ y[n]=x[n]*h[n] $
输入对$h[n]$卷积，求$y_"zs"[n]$(不是全响应)，系统必须是LTI系统

== 其他 单位阶跃响应 
= 系统的因果性和稳定性
== 因果性(casual)
系统输出不发生在输入之前，LTI系统的充要条件
$ h[n]=0, n<0 $
(inital reset)
== 稳定
对于LTI系统的单位脉冲响应, LTI的系统的充要条件
$ sum_(n=-infinity)^(+infinity) |h[n]|<infinity $
exp:
$ h[n]=a^n u[n] $
$ sum_(n=-infinity)^(+infinity) |h[n]|=sum_(n=-infinity)^(+infinity) |a^n u[n]|=sum_(n=0)^(+infinity) |a|^n $
$ =(1-|a|^n)/(1-|a|) $
当$|a|<1$时, 就是稳定的,$|a|>=1$就是不稳定的
= 离散时间系统的数学模型
== 一阶常系数差分方程
#image("image-2.png")
$ y[n]=x[n]-a y[n-1] $
$ y[n]+a y[n-1]=x[n] $
$ sum_(i=0)^N a_i y[n-i]=sum_(i=0)^N b_x x[n-i] $
递推法 
= 模拟信号数字化(samping)
$ "采样"->"量化"->"编码" $
#figure(caption: [一般用乘法器原信号乘以采样信号])[#image("image-3.png")]
理想采样用一系列单位脉冲响应来实现的，
$ P_delta (t)=sum_(n=-infinity)^infinity delta(t-n T) $
用$n T$代替连续信号中的$t$就得到抽样的离散信号表达式
$ x_a(t)=cos(2pi f t+theta)->x_a[n]=cos(2pi f T n+theta) $
$ 1/T=f_s "采样频率" $
$f_s$是原信号的频率的整数倍采样出来的信号才有周期性
#figure(caption: [采样定理和采样信号的恢复])[#image("image-4.png")]
