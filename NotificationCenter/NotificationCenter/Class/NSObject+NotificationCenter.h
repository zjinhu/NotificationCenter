//
//  NSObject+NotificationCenter.h
//  NotificationCenter
//
//  Created by 狄烨 . on 2018/12/13.
//  Copyright © 2018 HU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotificationTool.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (NotificationCenter)
@property (nonatomic, strong) NotificationTool *defaultNotiCenter;
@end

NS_ASSUME_NONNULL_END
