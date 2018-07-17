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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NotificationCenter defaultNotificationCenter] postNotificationName:@"name" object:@"11111111111"];
    
    //添加接受通知方法
    [[NotificationCenter defaultNotificationCenter] addObserverWithName:@"name" callBack:^(NSNotification * _Nonnull noti) {
        NSLog(@"%@",noti.object);
    }];
    // Do any additional setup after loading the view.
}

-(void)dealloc{
    //可以在视图退出的时候添加移除通知的方法,防止不移除通知下次再进来会收到两次通知
    [[NotificationCenter defaultNotificationCenter] removeObserver];
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
