//
//  NotificationTool.h
//  NotificationCenter
//
//  Created by HU on 2018/7/13.
//  Copyright © 2018年 HU. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion)(NSNotification * _Nonnull noti);

@interface NotificationTool : NSObject

- (void)addObserverWithName:(NSString *)name callBack:(Completion)callBack;
- (void)addObserverWithNames:(NSArray <NSString *>*)names callBack:(Completion)callBack;

- (void)postNotificationName:(NSString *)name;
- (void)postNotificationName:(NSString *)name object:(nullable id)anObject;

- (void)removeAllObserver;
- (void)removeObserverWithName:(NSString *)name;
- (void)removeObserverWithNames:(NSArray <NSString *> *)names;
@end
