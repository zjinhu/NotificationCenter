# NotificationCenter
block方式使用NSNotification，其中通知使用异步方式发送，不会阻塞线程，也可以直接使用同步通知post，接受默认为异步。
引入头文件会使用类别创建属性，使用属性发送接受通知。
同一个类同一名称的通知只会注册一个（最后添加的）。

# 发送通知
```objc
     [self.defaultNotiCenter postNotificationName:@"name" object:@"11111111111"];
```
# 接收通知
```objc
    [self.defaultNotiCenter addObserverWithName:@"name" callBack:^(NSNotification * _Nonnull noti) {
        NSLog(@"%@",noti.object);
    }];
```
# 移除通知  页面不需要去管理移除通知，dealloc的时候自动移除  

# 安装方式  
### 1.手动添加:<br>
*   1.将 NotificationCenter 文件夹添加到工程目录中<br>
*   2.导入 NotificationCenter.h

### 2.CocoaPods:<br>
*   1.在 Podfile 中添加 pod 'NotificationCenter'<br>
*   2.执行 pod install 或 pod update<br>
*   3.导入 NotificationCenter.h
