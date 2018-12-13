//
//  PushViewController.m
//  NotificationCenter
//
//  Created by HU on 2018/7/13.
//  Copyright © 2018年 HU. All rights reserved.
//

#import "PushViewController.h"
#import "NotificationCenter.h"
@interface PushViewController ()

@end

@implementation PushViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.defaultNotiCenter postNotificationName:@"name" object:@"11111111111"];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    //添加接受通知方法
    [self.defaultNotiCenter addObserverWithName:@"name" callBack:^(NSNotification * _Nonnull noti) {
        NSLog(@"%@",noti.object);
    }];
    // Do any additional setup after loading the view.
}

-(void)dealloc{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
