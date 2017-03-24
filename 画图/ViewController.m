//
//  ViewController.m
//  画图
//
//  Created by asl on 2016/11/21.
//  Copyright © 2016年 Invisionhealth Digital Inc. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PaintingView.h"

@interface ViewController ()

@property (nonatomic, strong) PaintingView *paintView;

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"initWithNibName");
    }
    return self;
}
- (void)loadView
{
    [super loadView];
    NSLog(@"loadView");
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad");
    self.paintView = [[PaintingView alloc] initWithFrame:CGRectMake(30, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_paintView];
    _paintView.width = 8;
    _paintView.color = [UIColor redColor];
    NSArray *array = @[@"小", @"中", @"大"];
    for (int i = 0; i < 6; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(5, 300 + 40 * i, 30, 25);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor yellowColor]];
        button.tag = 10 * i + 100;
        if (i < 3) {
            [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        }
        if (i == 3) {
            [button setBackgroundColor:[UIColor blackColor]];
        }
        if (i == 4) {
            [button setBackgroundColor:[UIColor redColor]];
        }
        if (i == 5) {
            [button setBackgroundColor:[UIColor blueColor]];
        }
        [button addTarget:self action:@selector(buttonAction1:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    
    
    NSArray *titleArr = @[@"保存", @"回退", @"恢复", @"清除"];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[titleArr objectAtIndex:i] forState:UIControlStateNormal];
        button.frame = CGRectMake(10 + (self.view.frame.size.width - 10) / 4 * i, self.view.frame.size.height - 50, (self.view.frame.size.width - 50) / 4, 40);
        button.tag = 10 * i + 10;
        [button setBackgroundColor:[UIColor redColor]];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
}


- (void)buttonAction1:(UIButton *)sender {
    switch (sender.tag) {
        case 100:
            self.paintView.width = 2.0;
            break;
        case 110:
            self.paintView.width = 8.0;
            break;
        case 120:
            self.paintView.width = 14.0;
            break;
        case 130:
            self.paintView.color = [UIColor blackColor];
            break;
        case 140:
            self.paintView.color = [UIColor redColor];
            break;
        case 150:
            self.paintView.color = [UIColor blueColor];
            break;
        default:
            break;
    }
}



- (void)buttonAction:(UIButton *)sender
{
    switch (sender.tag) {
        case 10:
            [self getCurrentView:self.view];
            break;
        case 20:
            [_paintView back];
            break;
        case 30:
            [_paintView resume];
            break;
        case 40:
            [_paintView clear];
            break;
        default:
            break;
    }
}

// 保存到手机相册
- (void)getCurrentView:(UIView *)currentView
{
    currentView = self.view;
    UIGraphicsBeginImageContext(currentView.bounds.size);
    [currentView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"保存成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
