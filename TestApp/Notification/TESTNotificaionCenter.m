//
//  TESTNotificaionCenter.m
//  TestApp
//
//  Created by tongyuan on 2019/10/5.
//  Copyright © 2019 tongyuan. All rights reserved.
//

#import "TESTNotificaionCenter.h"
typedef void (^TSNotificationBlock)(TSNotification *noti);

@interface TESTNotificaionModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) id observer;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) id object;
@property (nonatomic, copy) NSDictionary *userInfo;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, copy) TSNotificationBlock aBlock;

@end

@implementation TESTNotificaionModel

@end

@interface TESTNotificaionCenter ()
@property (nonatomic, strong) NSMutableArray *observerList;
@end

@implementation TESTNotificaionCenter

- (instancetype)init {
    if (self = [super init]) {
        _observerList = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (TESTNotificaionCenter *)defaultCenter {
    static TESTNotificaionCenter *defaultCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultCenter = [[TESTNotificaionCenter alloc] init];
    });
    return defaultCenter;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject
{
    TESTNotificaionModel *notificationModel = [[TESTNotificaionModel alloc] init];
    notificationModel.name = aName;
    notificationModel.observer = observer;
    notificationModel.selector = aSelector;
    notificationModel.object = anObject;
    
    [self.observerList addObject:notificationModel];
}

- (void)postNotification:(TSNotification *)notification {
    [self.observerList enumerateObjectsUsingBlock:^(TESTNotificaionModel   * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([notification.name isEqualToString:obj.name]) {
            if (obj.queue) {
                NSOperationQueue *queue = obj.queue;
                NSOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
                    obj.aBlock(notification);
                }];
                [queue addOperation:operation];
                
            }
            else {
                [obj.observer performSelector:obj.selector withObject:notification];
            }
        }
    }];
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject {
    [self postNotificationName:aName object:anObject userInfo:nil];
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    TSNotification *notification = [[TSNotification alloc] initWithName:aName object:anObject userInfo:aUserInfo];
    [self postNotification:notification];
}

- (void)removeObserver:(id)observer {
    NSMutableArray *removedArray = [[NSMutableArray alloc] init];
    [self.observerList enumerateObjectsUsingBlock:^(TESTNotificaionModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.observer isEqual:observer]) {
            [removedArray addObject:obj];
        }
    }];
    [self.observerList removeObjectsInArray:removedArray];
}

- (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject {
    if (!observer) return;
    
    NSMutableArray *removedArray = [[NSMutableArray alloc] init];
    [self.observerList enumerateObjectsUsingBlock:^(TESTNotificaionModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.observer isEqual:observer] && [obj.name isEqualToString:aName] && [obj.object isEqual:anObject]) {
            [removedArray addObject:obj];
        }
    }];
    
    [self.observerList removeObjectsInArray:removedArray];
}

- (id<NSObject>)addObserverForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(TSNotification * _Nonnull))block {
    TESTNotificaionModel *notificationModel = [[TESTNotificaionModel alloc] init];
    notificationModel.name = name;
    notificationModel.queue = queue;
    notificationModel.aBlock = block;
    notificationModel.object = obj;
    
    [self.observerList addObject:notificationModel];
    return nil;
}
@end
