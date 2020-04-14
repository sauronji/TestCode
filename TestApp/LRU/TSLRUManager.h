//
//  TSLRUManager.h
//  TestApp
//
//  Created by tongyuan on 2019/12/3.
//  Copyright © 2019 tongyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSLRUManager : NSObject
- (id)getSomeObjForKey:(NSString *)key;

- (void)addSomeObj:(id)someObj forKey:(NSString *)key;

- (void)trimWithTimeInterval:(NSTimeInterval)timeInterval;

- (void)trimWithCost:(NSInteger)cost;

//- (void)trimWith
@end

NS_ASSUME_NONNULL_END
