//
//  TSLRUManager.m
//  TestApp
//
//  Created by tongyuan on 2019/12/3.
//  Copyright © 2019 tongyuan. All rights reserved.
//

#import "TSLRUManager.h"
#import "TSLRUItem.h"

@interface TSLRUManager ()
@property (nonatomic, strong) TSLRUItem *LRUItemHeader;
@property (nonatomic, strong) NSMutableDictionary *lruDic;
@end

@implementation TSLRUManager

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)setUpLRUStruct {
    
}

#pragma mark Public
- (void)trimWithTimeInterval:(NSTimeInterval)timeInterval {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    TSLRUItem *firstItem = self.LRUItemHeader.next;
    
    while (firstItem) {
        if (firstItem.lastModifyTime < timeInterval) {
            [result addObject:firstItem];
        }
        firstItem = firstItem.next;
    }
    
    for (TSLRUItem *item in result) {
        [self deleteItemInLRUForKey:item.key];
    }
}

- (void)trimWithCost:(NSInteger)cost {
    NSMutableArray *result = [[NSMutableArray alloc] init];
}

-(id)getSomeObjForKey:(NSString *)key {
    if (!key.length) return nil;
    
    TSLRUItem *currentItem = [self deleteItemInLRUForKey:key];
    [self addLRUItem:currentItem forKey:key];
    return [self.lruDic objectForKey:key];
}

- (void)addSomeObj:(id)someObj forKey:(NSString *)key {
    if (!key.length || !someObj) return;
    
    [self.lruDic setObject:someObj forKey:key];
    [self insertSomeObjInLRU:someObj forKey:key];
}

- (TSLRUItem *)deleteItemInLRUForKey:(NSString *)key {
    [self.lruDic removeObjectForKey:key];
    
    TSLRUItem *lruItem = self.LRUItemHeader.next;
    while (lruItem) {
        if ([lruItem.key isEqualToString:key]) {
            TSLRUItem *preNode = lruItem.pre;
            TSLRUItem *nextNode = lruItem.next;
            preNode.next = lruItem.next;
            nextNode.pre = preNode;
            break;
        }
        lruItem = lruItem.next;
    }
    return lruItem;
}

#pragma mark Private
- (void)addLRUItem:(TSLRUItem *)item forKey:(NSString *)key {
    TSLRUItem *firstNode = self.LRUItemHeader.next;
        
    TSLRUItem *currentNode = item;
    currentNode.useCount += 1;
    currentNode.lastModifyTime = [[NSDate date] timeIntervalSince1970];
    self.LRUItemHeader.next = currentNode;
    currentNode.pre = self.LRUItemHeader;
    currentNode.next = firstNode;
    
    firstNode.pre = currentNode;
}

- (void)insertSomeObjInLRU:(id)someObj forKey:(NSString *)key{
    if (!someObj) return;
    
    TSLRUItem *firstNode = self.LRUItemHeader.next;
    
    TSLRUItem *currentNode = [[TSLRUItem alloc] init];
    currentNode.value = someObj;
    currentNode.key = [key copy];
    currentNode.useCount = 1;
    currentNode.lastModifyTime = [[NSDate date] timeIntervalSince1970];;
    self.LRUItemHeader.next = currentNode;
    currentNode.pre = self.LRUItemHeader;
    currentNode.next = firstNode;
    
    firstNode.pre = currentNode;
}

#pragma mark Get
- (TSLRUItem *)LRUItemHeader {
    if (!_LRUItemHeader) {
        _LRUItemHeader = [[TSLRUItem alloc] init];
        _LRUItemHeader.pre = nil;
        
    }
    return _LRUItemHeader;
}

- (NSMutableDictionary *)lruDic {
    if (!_lruDic) {
        _lruDic = [[NSMutableDictionary alloc] init];
    }
    return _lruDic;
}
@end
