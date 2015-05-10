//
//  ViewController.m
//  photo_demo
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 HanHe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray * _desc;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取应用程序运行根路径
    //NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"desc" ofType:@"plist"];
    
    //读取配置文件数据装载到数组中
    _desc = [NSArray arrayWithContentsOfFile:path];
    
    //设置图片边框及颜色
    _imagePic.layer.borderWidth = 1;
    _imagePic.layer.borderColor = [[UIColor redColor] CGColor];
    
    UIButton *btn = [[UIButton alloc] init];
    
    //设置大小位置
    [btn setFrame:CGRectMake((self.view.frame.size.width-100) * 0.5, (self.view.frame.size.height-60) * 0.5, 100, 60)];
    
    //[正常状态] 设置文字、颜色、字体
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
    
    
    //[激活状态] 设置文字、颜色
    [btn setTitle:@"放开我" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    
    //背景图片 0
    [btn setBackgroundImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateNormal];

    //背景图片 1
    UIImage *img = [UIImage imageNamed:@"1.png"];
    [btn setBackgroundImage:img forState:UIControlStateHighlighted];
    
    //事件绑定
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    //[self.view insertSubview:btn atIndex:self.view.subviews.count+1];
}

#pragma mark - 生成的事件
- (IBAction)slibar_change:(UISlider*)sender {
    
    int f = (int) sender.value;
    
    //切换标题数字
    NSString *numStr = [NSString stringWithFormat:@"%i/%lu",(f+1),(unsigned long)_desc.count];
    _lab_nums.text = numStr;
    
    //切换图片
    NSString *fileName = [NSString stringWithFormat:@"%i.jpg",f];
    _imagePic.image = [UIImage imageNamed:fileName];
    
    //切换图片介绍
    _lab_desc.text = _desc[f];
}

#pragma mark - 自定义方法 （点击事件）
-(void) click : (UIButton*) sender{

    NSLog(@"%@-点击啦!",sender);

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    NSLog(@"资源释放...");
}

- (IBAction)onClick:(UIButton *)sender {
    
    int num = self.view.frame.size.height - _viewDown.frame.origin.y - _viewDown.frame.size.height;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:0.5];
    
    if(num == 0){

        _viewDown.frame = CGRectMake(0, self.view.frame.size.height+_viewDown.frame.size.height, self.view.frame.size.width, _viewDown.frame.size.height);
        
    }else{
     
          _viewDown.frame = CGRectMake(0, self.view.frame.size.height- _viewDown.frame.size.height, self.view.frame.size.width, _viewDown.frame.size.height);
     
    }
    
    [UIView commitAnimations];
}

- (IBAction)switch_valueChange:(UISwitch *)sender {
    
    if(sender.isOn)
    {
        self.view.backgroundColor = [UIColor  blackColor];
        
        _viewDown.backgroundColor =self.view.backgroundColor;
        
    }else{
    
        self.view.backgroundColor = [UIColor  whiteColor];
        
        _viewDown.backgroundColor = [UIColor greenColor];
        
    }
    
}

- (IBAction)zoom_slider:(UISlider *)sender {
    
    float f = sender.value;
    
    _imagePic.transform = CGAffineTransformMakeScale(f, f);
}
@end
