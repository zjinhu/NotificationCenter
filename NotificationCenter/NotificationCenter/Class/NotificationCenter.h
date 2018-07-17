//
//  NotificationCenter.h
//  NotificationCenter
//
//  Created by HU on 2018/7/13.
//  Copyright © 2018年 HU. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion)(NSNotification * _Nonnull noti);

@interface NotificationCenter : NSObject

+ (NotificationCenter *)defaultNotificationCenter;

- (void)addObserverWithName:(NSString *)name callBack:(Completion)callBack;

- (void)postNotificationName:(NSString *)name;
- (void)postNotificationName:(NSString *)name object:(nullable id)anObject;

- (void)removeObserver;
@end
