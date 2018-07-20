# NotificationCenter
block方式使用NSNotification，其中通知使用异步方式发送，不会阻塞线程

# 发送通知
```objc
    [[NotificationCenter defaultNotificationCenter] postNotificationName:@"name" object:@"11111111111"];
```
# 接收通知
```objc
    [[NotificationCenter defaultNotificationCenter] addObserverWithName:@"name" callBack:^(NSNotification * _Nonnull noti) {
        NSLog(@"%@",noti.object);
    }];
```
# 移除通知  页面需要移除通知不然会多次接收通知   
```objc
    [[NotificationCenter defaultNotificationCenter] removeObserver];
```
# 安装方式  
### 1.手动添加:<br>
*   1.将 NotificationCenter 文件夹添加到工程目录中<br>
*   2.导入 NotificationCenter.h

### 2.CocoaPods:<br>
*   1.在 Podfile 中添加 pod 'NotificationCenter'<br>
*   2.执行 pod install 或 pod update<br>
*   3.导入 NotificationCenter.h
