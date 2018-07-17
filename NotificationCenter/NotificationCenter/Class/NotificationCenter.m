//
//  NotificationCenter.m
//  NotificationCenter
//
//  Created by HU on 2018/7/13.
//  Copyright © 2018年 HU. All rights reserved.
//

#import "NotificationCenter.h"

@interface NotificationCenter()
@property (strong, nonatomic) NSNotificationCenter *notificationCenter;
@property (strong, nonatomic) NSString *name;
@end

@implementation NotificationCenter

- (instancetype)init{
    self = [super init];
    if (self) {
        _notificationCenter = [NSNotificationCenter defaultCenter];
    }
    return self;
}

+ (NotificationCenter *)defaultNotificationCenter{
    static NotificationCenter *notificationCenter = nil;
    static dispatch_once_t onceToken;
    __weak typeof(self) weakSelf = self;
    dispatch_once(&onceToken, ^{
        notificationCenter = [weakSelf new];
    });
    return notificationCenter;
}

- (void)addObserverWithName:(NSString *)name callBack:(Completion)callBack{
    _name = name;
    [_notificationCenter addObserverForName:name object:nil queue:[NSOperationQueue mainQueue] usingBlock:callBack];
}

- (void)postNotificationName:(NSString *)name{
    //也可以使用同步通知
    //    [_notificationCenter postNotificationName:name object:nil userInfo:nil];
    //使用异步通知
    [[NSNotificationQueue defaultQueue] enqueueNotification:[NSNotification notificationWithName:name object:nil] postingStyle:NSPostWhenIdle coalesceMask:NSNotificationCoalescingOnName forModes:nil];
}

- (void)postNotificationName:(NSString *)name object:(nullable id)anObject{
    [[NSNotificationQueue defaultQueue] enqueueNotification:[NSNotification notificationWithName:name object:anObject] postingStyle:NSPostWhenIdle coalesceMask:NSNotificationCoalescingOnName forModes:nil];
}

- (void)removeObserver{
    ///由于使用了addObserverForName,所以这样移除通知
    [_notificationCenter removeObserver:self];
    _notificationCenter = nil;
}
@end
