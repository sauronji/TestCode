//
//  TSNotification.m
//  TestApp
//
//  Created by tongyuan on 2019/10/5.
//  Copyright © 2019 tongyuan. All rights reserved.
//

#import "TSNotification.h"

@implementation TSNotification

- (instancetype)initWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo {
    if (self = [super init]) {
        _name = name;
        _object = object;
        _userInfo = userInfo;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return nil;
}

+ (instancetype)notificationWithName:(NSString *)aName object:(id)anObject {
    return [self notificationWithName:aName object:anObject userInfo:nil];
}

+ (instancetype)notificationWithName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    return [[self alloc] initWithName:aName object:anObject userInfo:aUserInfo];
}
@end
