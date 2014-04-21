//
//  Util.m
//  StudentManager
//
//  Created by Nguyễn Nam Phong on 4/21/14.
//  Copyright (c) 2014 Phongnn. All rights reserved.
//

#import "Util.h"

@implementation Util

+ (Util *)sharedUtil
{
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [[self alloc] init];
    })
}

@end
