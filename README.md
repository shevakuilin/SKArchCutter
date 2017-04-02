# 简述


SKArchCutter是一个可自选切割角的圆角切割工具，同时支持UIView、UIImageView、UIButton和UILabel的单角切圆/选角拱形切圆/全角切圆，并且避免了UIImageView使用系统圆角所导致的离屏渲染的问题，以及确保layer对象的masksToBounds属性始终为NO，从而使得项目中大量使用圆角时的性能得到很大程度的优化, 最重要的是使用简单、方便。如果觉得还不错，star支持下吧~

# 最新更新

- 解决使用Masonry布局无法及时获取frame信息的兼容问题

- 解决使用border而导致的失效问题

- 改为类方法，使用更加简单方便

- 注意：如果之前设置了`border`和`backgroundColor`请取消，关闭`masksToBounds`(如果打开了话), 请在方法中进行设置

### 效果图 
<img src="http://ofg0p74ar.bkt.clouddn.com/SKArchCutter.png" width="370" height ="665" />


### 测试性能
<img src="http://ofg0p74ar.bkt.clouddn.com/SKArchCutter.gif" width="370" height ="665" />



# 如何开始


1.从GitHub上Clone-->SKArchCutter，然后查看Demo

2.直接将目录下的SKArchCutter拷贝到工程中，或在podfile文件夹中添加 ```pod 'SKArchCutter'```

3.如果觉得还不错，点个star吧~


# 使用方法

#### 头文件导入
```objectivec
#import "SKArchCutter.h"
```

#### 进行圆角切割


UIView/UIButton/UILabel
```objectivec
[SKArchCutter cuttingView:self.centerView cuttingDirection:UIRectCornerTopRight | UIRectCornerTopLeft cornerRadii:self.centerView.frame.size.height / 2 borderWidth:1 borderColor:[UIColor purpleColor] backgroundColor:[UIColor redColor]];
```

UIImageView
```objectivec
[SKArchCutter cuttingImageView:self.topImageView cuttingDirection:UIRectCornerAllCorners cornerRadii:self.topImageView.frame.size.height / 2 borderWidth:1 borderColor:[UIColor blackColor] backgroundColor:[UIColor clearColor]];
```


### 感谢你花时间阅读以上内容, 如果这个项目能够帮助到你，记得告诉我


Email: shevakuilin@gmail.com
