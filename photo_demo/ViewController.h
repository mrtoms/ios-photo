//
//  ViewController.h
//  photo_demo
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 HanHe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(void) click : (UIButton*) sender;

- (IBAction)slibar_change:(UISlider *)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imagePic;

@property (strong, nonatomic) IBOutlet UILabel *lab_desc;

@property (strong, nonatomic) IBOutlet UILabel *lab_nums;


@property (strong, nonatomic) IBOutlet UIView *viewDown;

- (IBAction)onClick:(UIButton *)sender;

- (IBAction)switch_valueChange:(UISwitch *)sender;

- (IBAction)zoom_slider:(UISlider *)sender;

@end

