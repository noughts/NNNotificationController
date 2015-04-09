//
//  NNNotificationController.h
//  NNNotificationControllerDemo
//
//  Created by noughts on 2014/08/19.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NNNotificationController : NSObject

+(instancetype)controllerWithObserver:(id)observer;

- (id)observeForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *note))block;
- (void)observeForName:(NSString*)aName object:(id)anObject selector:(SEL)aSelector;

- (void)unobserve:(id)object keyPath:(NSString *)keyPath;
- (void)unobserve:(id)object;

- (void)unobserveAll;

@end
