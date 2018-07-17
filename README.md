# NotificationCenter
block方式使用NSNotification，其中通知使用异步方式发送，不会阻塞线程

# 发送通知
    [[NotificationCenter defaultNotificationCenter] postNotificationName:@"name" object:@"11111111111"];
# 接收通知
    [[NotificationCenter defaultNotificationCenter] addObserverWithName:@"name" callBack:^(NSNotification * _Nonnull noti) {
        NSLog(@"%@",noti.object);
    }];
# 移除通知  页面需要移除通知不然会多次接收通知
    [[NotificationCenter defaultNotificationCenter] removeObserver];
# 安装方式 
pod NotificationCenter
或者直接拖文件
