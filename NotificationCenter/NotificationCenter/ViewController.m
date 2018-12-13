//
//  ViewController.m
//  NotificationCenter
//
//  Created by HU on 2018/7/13.
//  Copyright © 2018年 HU. All rights reserved.
//

#import "ViewController.h"
#import "PushViewController.h"
#import "NotificationCenter.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 50);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
    [self.defultCenter addObserverWithName:@"name" callBack:^(NSNotification * _Nonnull noti) {
        NSLog(@"%@",noti.object);
    }];
}

- (void)clickItem:(UIButton *)sender {
    PushViewController *vc = [PushViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    
}

@end
