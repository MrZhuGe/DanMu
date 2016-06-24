# DanMu
一款超简单的弹幕组件，逻辑简单，定制性强，适用于任何场景...

弹幕有两种模式，一种是自右向左滚动后消失，一种是淡入淡出后消失，现阶段实现的是最简单的组件，所以可以自己添加更多的个性化需求

导入头文件：
ZJZDanMu.h

创建弹幕模板：
ZJZDanMu *danmu = [[ZJZDanMu alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width * 9 / 16)];

添加到当前视图：
[self.view addSubview:danmu];

插入一条弹幕：
[danmu insertDML:@"我是弹幕"];

如果您有更好的建议和方法，欢迎留言指正。
