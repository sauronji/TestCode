//
//  TSDownloadManager.m
//  TestApp
//
//  Created by tongyuan on 2020/3/5.
//  Copyright © 2020 tongyuan. All rights reserved.
//

#import "TSDownloadManager.h"

@interface TSDownloadManager ()
@property (nonatomic, strong) NSOperationQueue *downloadQueue;
@end

@implementation TSDownloadManager


#pragma mark - Private
- (void)addDownloadTask:(NSString *)downloadURL {
    
    [self.downloadQueue addOperationWithBlock:^{
//        self.
    }];
//    [self.downloadQueue ]
}

#pragma mark - Get
- (NSOperationQueue *)downloadQueue {
    if (!_downloadQueue) {
        _downloadQueue = [[NSOperationQueue alloc] init];
        _downloadQueue.maxConcurrentOperationCount = 2;
    }
    return _downloadQueue;
}
@end
