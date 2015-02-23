//
//  NNNotificationController.m
//  NNNotificationControllerDemo
//
//  Created by noughts on 2014/08/19.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NNNotificationController.h"

@implementation NNNotificationController{
	NSHashTable* _observers;
}

+(instancetype)controllerWithObserver:(id)observer{
	return [[self alloc] initWithObserver:observer];
}



- (instancetype)initWithObserver:(id)observer{
	self = [super init];
	if (nil != self) {
		_observers = [NSHashTable weakObjectsHashTable];
	}
	return self;
}



-(void)dealloc{
	[self unobserveAll];
}


- (id)addObserverForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *note))block{
	id observer = [[NSNotificationCenter defaultCenter] addObserverForName:name object:obj queue:queue usingBlock:block];
	[_observers addObject:observer];
	return observer;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject{
	[_observers addObject:observer];
	[[NSNotificationCenter defaultCenter] addObserver:observer selector:aSelector name:aName object:anObject];
}


-(void)unobserveAll{
	for (id observer in _observers) {
		[[NSNotificationCenter defaultCenter] removeObserver:observer];
	}
	[_observers removeAllObjects];
}




@end
