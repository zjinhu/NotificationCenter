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
- (void)setDefultCenter:(NotificationTool *)defultCenter{
    objc_setAssociatedObject(self, NotificationCenterKey, defultCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NotificationTool *)defultCenter{
    NotificationTool *defultCenter = objc_getAssociatedObject(self, NotificationCenterKey);
    if (defultCenter==nil) {
        defultCenter = [[NotificationTool alloc] init];
        self.defultCenter = defultCenter;
    }
    return defultCenter;
}
@end
