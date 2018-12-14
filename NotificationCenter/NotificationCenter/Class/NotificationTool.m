//
//  NotificationTool.m
//  NotificationCenter
//
//  Created by HU on 2018/7/13.
//  Copyright © 2018年 HU. All rights reserved.
//

#import "NotificationTool.h"

@interface NotificationTool()
@property (nonatomic, strong) NSMutableDictionary *observers;
@end

@implementation NotificationTool

- (NSMutableDictionary *)observers {
    if (!_observers) {
        _observers = [NSMutableDictionary dictionary];
    }
    return _observers;
}

- (void)addObserverWithNames:(NSArray <NSString *>*)names callBack:(Completion)callBack{
    [names enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addObserverWithName:name callBack:callBack];
    }];
     NSLog(@"%@",self.observers);
}

- (void)addObserverWithName:(NSString *)name callBack:(Completion)callBack{
    if (name) {
        id obv = [[NSNotificationCenter defaultCenter] addObserverForName:name object:nil queue:[NSOperationQueue mainQueue] usingBlock:callBack];
        [self.observers setObject:obv forKey:name];
    }
}

- (void)postNotificationName:(NSString *)name{
    //也可以使用同步通知
    //    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil userInfo:nil];
    //使用异步通知
    [[NSNotificationQueue defaultQueue] enqueueNotification:[NSNotification notificationWithName:name object:nil] postingStyle:NSPostWhenIdle coalesceMask:NSNotificationCoalescingOnName forModes:nil];
}

- (void)postNotificationName:(NSString *)name object:(nullable id)anObject{
    [[NSNotificationQueue defaultQueue] enqueueNotification:[NSNotification notificationWithName:name object:anObject] postingStyle:NSPostWhenIdle coalesceMask:NSNotificationCoalescingOnName forModes:nil];
}

- (void)removeAllObserver {
    [self.observers.allKeys enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL * _Nonnull stop) {
        [self removeObserverWithName:name];
    }];
}

- (void)removeObserverWithName:(NSString *)name {
    if (name) {
        [[NSNotificationCenter defaultCenter] removeObserver:self.observers[name]];
        [self.observers removeObjectForKey:name];
    }
}

- (void)removeObserverWithNames:(NSArray<NSString *> *)names {
    [names enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL * _Nonnull stop) {
        [self removeObserverWithName:name];
    }];
}

-(void)dealloc {
    [self removeAllObserver];
}
@end
