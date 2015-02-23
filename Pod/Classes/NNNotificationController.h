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
- (void)observe:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;
- (void)unobserveAll;

@end
