//
//  TSNotification.h
//  TestApp
//
//  Created by tongyuan on 2019/10/5.
//  Copyright © 2019 tongyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSNotification : NSObject

@property (readonly, copy) NSString *name;
@property (nullable, readonly, strong) id object;
@property (nullable, readonly, copy) NSDictionary *userInfo;

- (instancetype)initWithName:(NSString *)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0)) NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;

+ (instancetype)notificationWithName:(NSString *)aName object:(nullable id)anObject;
+ (instancetype)notificationWithName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;
@end

NS_ASSUME_NONNULL_END
