# DanMu
一款超简单的弹幕组件，逻辑简单，定制性强，适用于任何场景...

导入头文件：
#import "ZJZDanMu.h"

创建弹幕模板：
ZJZDanMu *danmu = [[ZJZDanMu alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width * 9 / 16)];

添加到当前视图：
[self.view addSubview:danmu];

插入一条弹幕：
[danmu insertDML:@"我是弹幕"];
