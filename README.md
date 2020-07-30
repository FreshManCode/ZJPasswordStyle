# ZJPasswordStyle

用于平时开发过程中用到的密码输入框的样式问题,本案例提供了四中样式,案例中有些写法使用了继承有些使用了协议,如有需要可以自行修改或者再次封装处理,如果发现有问题,请issue,谢谢.
是目前使用比较多的样式,分别如下:

* 下划线高亮明文输入框样式,如下图

![](https://xunpizhangjj.coding.net/p/CodingImageURL/d/CodingImageURL/git/raw/master/PasswordStyle/%E4%B8%8B%E5%88%92%E7%BA%BF%E9%AB%98%E4%BA%AE%E6%98%8E%E6%96%87.png)


* 下划线高亮密文样式,如下图:
![](https://xunpizhangjj.coding.net/p/CodingImageURL/d/CodingImageURL/git/raw/master/PasswordStyle/%E4%B8%8B%E5%88%92%E7%BA%BF%E9%AB%98%E4%BA%AE%E5%AF%86%E6%96%87.png)

* 矩形框明文样式,如下图:
![](https://xunpizhangjj.coding.net/p/CodingImageURL/d/CodingImageURL/git/raw/master/PasswordStyle/%E7%9F%A9%E5%BD%A2%E6%A1%86%E6%98%8E%E6%96%87%E8%BE%93%E5%85%A5%E5%AF%86%E7%A0%81.png)

* 矩形框密文样式,如下图:
![](https://xunpizhangjj.coding.net/p/CodingImageURL/d/CodingImageURL/git/raw/master/PasswordStyle/%E7%9F%A9%E5%BD%A2%E6%A1%86%E5%AF%86%E6%96%87.png)


输入到指定位数(目前设定的是6位,项目中有对应的回调,本例使用了Alert提示如下图:)

![](https://xunpizhangjj.coding.net/p/CodingImageURL/d/CodingImageURL/git/raw/master/PasswordStyle/%E7%9F%A9%E5%BD%A2%E6%A1%86%E5%AF%86%E6%96%87%E5%AF%86%E7%A0%81%E9%95%BF%E5%BA%A6%E8%BE%BE%E5%88%B06%E4%BD%8D.png)

![](https://xunpizhangjj.coding.net/p/CodingImageURL/d/CodingImageURL/git/raw/master/PasswordStyle/%E7%9F%A9%E5%BD%A2%E6%A1%86%E6%98%8E%E6%96%876%E4%BD%8D%E5%AF%86%E7%A0%81.png)

* 输入密码之后,具有类似于支付宝提交支付密码的一个过渡提交动画.具体样式如下gif展示:

![](https://xunpizhangjj.coding.net/p/CodingImageURL/d/CodingImageURL/git/raw/master/PasswordStyle/PasswordAnimated.gif)

*注: *动画的实现参考了这篇博主的实现思路,起初我还以为是图片,后来看到了这个思路恍然大悟.原文的链接如下:[原文地址](https://blog.csdn.net/u013282507/article/details/70208141)

如需要自行修改回调逻辑以及相关样式可以参照对应的子类以及**ZJPasswordViewProtocol**这个协议类中,包含了回调的委托方法,以及可以自定义相关样式或者逻辑的TextfieldView应该事先的协议方法.

下述则是委托方法,包含了目前定义的几种事件类型,以及输入达到6位密码之后的通知.
	/**
	 对应的代理事件
	 
	 @param textfieldView 响应的包含Textfield 的view
	 @param result 加密后的结果(有些情况下可能为空)
	 @param type 事件类型
	 */
	- (void)textfieldView:(UIView <ZJPasswordViewProtocol> *)textfieldView
	               result:(NSString *)result
	            eventType:(ZJPasswordViewEventType)type;
		




