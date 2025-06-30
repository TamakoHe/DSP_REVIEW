#set text(size: 15pt, font: ("Arial","Source Han Serif SC"))
#set heading(numbering: "1.")
#align(center)[#text(size: 25pt)[*FIR滤波器*]]
= 数学模型(没有反馈回路)
$ y[n]=sum_(k=0)^(N-1) b_k x[n-k] $
单位脉冲响应:$h[n]=sum_(k=0)^(N-1) b_k delta[n-k]$
= 系统函数 
$ H[z]=sum_(k=0)^(N-1) b_k z^(-k) $
零点:$sum_(k=0)^(N-1) b_k z^(-k)=0$

极点:$z^(-k)=0$, 在原点处的$N-1$阶极点

极点是原点，一定是稳定的右边序列

*稳定是FIR滤波器重要的优点*
- exp1 球FIR滤波器的频率响应 
#image("image-80.png")
隔直滤波器$omega=0, abs(H(e^(j omega)=0))$, 完全滤除频率为0的直流分量 

= FIR滤波器系数和单位脉冲响应的对应关系 
$ h[n]=sum_(k=0)^(N-1) b_k delta[n-k] $
$ h[0]=b_0 $
$ h[1]=b_1 $
$ h[k]=b_k $
*用了N-1个延时器，所以是N-1阶FIR滤波器*

