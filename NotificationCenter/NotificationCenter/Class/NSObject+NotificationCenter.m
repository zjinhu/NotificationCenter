//
//  NSObject+NotificationCenter.m
//  NotificationCenter
//
//  Created by 狄烨 . on 2018/12/13.
//  Copyright © 2018 HU. All rights reserved.
//

#import "NSObject+NotificationCenter.h"
#import <objc/runtime.h>
static const void *NotificationCenterKey = &NotificationCenterKey;

@implementation NSObject (NotificationCenter)
- (void)setDefaultNotiCenter:(NotificationTool *)defaultNotiCenter{
    objc_setAssociatedObject(self, NotificationCenterKey, defaultNotiCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NotificationTool *)defaultNotiCenter{
    NotificationTool *defaultNotiCenter = objc_getAssociatedObject(self, NotificationCenterKey);
    if (!defaultNotiCenter) {
        defaultNotiCenter = [[NotificationTool alloc] init];
        self.defaultNotiCenter = defaultNotiCenter;
    }
    return defaultNotiCenter;
}
@end
