//
//  ViewController.m
//  DanMu
//
//  Created by 郑家柱 on 16/6/17.
//  Copyright © 2016年 Jiangsu Houxue Network Information Technology Limited By Share Ltd. All rights reserved.
//

#import "ViewController.h"
#import "ZJZDanMu.h"

#define KZJZIJKSCREENWIDTH          [UIScreen mainScreen].bounds.size.width
#define KZJZIJKSCREENHEIGHT         [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) ZJZDanMu *danmu;
@property (nonatomic, strong) NSTimer  *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.danmu = [[ZJZDanMu alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width * 9 / 16)];
    [self.view addSubview:self.danmu];
    
    NSArray *array = @[@"开始", @"结束", @"全屏切换"];
    CGFloat w = self.view.frame.size.width/3;
    for (int i = 0; i < 3; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 100 + i;
        btn.frame = CGRectMake(w * i, self.danmu.frame.size.height + 40, w, 40);
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)onBtnClicked:(UIButton *)button
{
    if (button.tag == 100) {
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05f target:self selector:@selector(onTimerClicked:) userInfo:nil repeats:YES];
        
    } else if (button.tag == 101) {
        [self.timer invalidate];
    } else {
        
        if (button.selected) {
            
            button.selected = NO;
            [self.danmu resetFrame:CGRectMake(0, 20, KZJZIJKSCREENWIDTH, KZJZIJKSCREENWIDTH * 9/16)];
            
            [UIView animateWithDuration:0.4f animations:^{
                
                // 逆时针旋转90度
                [self.danmu setTransform:CGAffineTransformMakeRotation(90 * M_PI)];
                self.danmu.frame = CGRectMake(0, 20, KZJZIJKSCREENWIDTH, KZJZIJKSCREENWIDTH * 9/16);
                
                [self.danmu layoutIfNeeded];
            }];
            
        } else {
            
            button.selected = YES;
            
            // 置于父视图顶层
            //[[self superview] bringSubviewToFront:self];
            
            [self.danmu resetFrame:CGRectMake(0, 0, KZJZIJKSCREENHEIGHT, KZJZIJKSCREENWIDTH)];
            [UIView animateWithDuration:0.4f animations:^{
                
                // 顺时针旋转90度
                [self.danmu setTransform:CGAffineTransformTranslate(CGAffineTransformMakeRotation(M_PI_2), (KZJZIJKSCREENWIDTH - KZJZIJKSCREENWIDTH * 9/16) / 2 - 20, (KZJZIJKSCREENWIDTH - KZJZIJKSCREENWIDTH * 9/16) / 2)];
                
                self.danmu.frame = CGRectMake(0, 0, KZJZIJKSCREENWIDTH, KZJZIJKSCREENHEIGHT);
                
                [self.danmu layoutIfNeeded];
                
            }];
        }
    }
}

- (void)onTimerClicked:(NSTimer *)timer
{
    NSArray *array = @[@"帅哥、美女", @"你怎么这么漂亮", @"我喜欢小清新，小清新很可爱", @"主播好污", @"这些都是什么玩意儿", @"受不了", @"哈哈...", @"主播怎么这么帅呢，吃啥饲料长大的", @"不错不错", @"我悄悄的来，不带走一片云彩", @"好事好事，你看我都夸你了，没有表示吗", @"打飞机", @"打坦克", @"拍蚊子", @"长得真是寒碜人啊"];
    [self.danmu insertDML:array[arc4random_uniform(15)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
