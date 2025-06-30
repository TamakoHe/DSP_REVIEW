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
= FIR数字滤波器的分类
== 第一类线性相位
$ h[n]=h[N-1-n] $
#image("image-81.png")
== 第二类线性相位
$ h[n]=-h[N-1-n] $ 
= 设计第一类线性相位滤波器
$ h[n]=h[N-1-n] $
群时延:$tau=(N-1)/2$
$ phi(omega)=-tau omega $
#figure(caption: [系统的幅频响应特征])[#image("image-82.png")]
= exp1 
#image("image-83.png")
关于中间值偶对称，属于第一类线性相位滤波器
$ tau=(3-1)/2=1 $
$ phi(omega)=-tau omega=-omega $
$ abs(H(e^(j omega)))=h(tau)+sum_(n=0)^(tau-1) 2h[n]cos(omega(n-tau))=2+2cos omega $
#figure(caption: [第三问,求输出])[#image("image-84.png")]
#figure(caption: [矩形窗])[#image("image-85.png")]
#figure(caption: [常见的窗函数])[#image("image-86.png")]
#image("image-87.png")
#image("image-88.png")
= 频率采样法
给定一个理想的频率响应$H_d (e^(j omega))$, 等间隔采样 
$ H_d (e^(j omega))=H_d (k) $
然后对$H_d(k)$进行IDFT得到$h[n]$, 然后$z$变换得到$H(z)$. 
== exp1 
#image("image-89.png")
#image("image-90.png")
#figure(caption: [第一类FIR滤波器])[#image("image-92.png")]
== exp2 
#image("image-93.png")
#image("image-94.png")
#image("image-95.png") 
== 设计步骤
#figure(caption: [设计步骤])[#image("image-96.png")]
