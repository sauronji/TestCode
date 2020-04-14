//
//  TSOperation.m
//  TestApp
//
//  Created by tongyuan on 2020/3/5.
//  Copyright © 2020 tongyuan. All rights reserved.
//

#import "TSOperation.h"

@interface TSOperation ()
@property (nonatomic, assign) NSTimeInterval downloadTimeInterval;

@end

@implementation TSOperation

- (void)main {
    self.downloadTimeInterval = 60;
    
    [NSThread sleepForTimeInterval:self.downloadTimeInterval];
    
}
@end
