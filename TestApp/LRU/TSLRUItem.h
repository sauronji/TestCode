//
//  TSLRUItem.h
//  TestApp
//
//  Created by tongyuan on 2019/12/3.
//  Copyright © 2019 tongyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSLRUItem : NSObject
@property (nonatomic, copy) NSString *key;
@property (nonatomic, strong, nullable) TSLRUItem *next;
@property (nonatomic, strong, nullable) TSLRUItem *pre;
@property (nonatomic, strong) id value;
@property (nonatomic, assign) NSTimeInterval lastModifyTime;
@property (nonatomic, assign) NSInteger useCount;
@end

NS_ASSUME_NONNULL_END
