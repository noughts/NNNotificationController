//
//  NNNotificationController.m
//  NNNotificationControllerDemo
//
//  Created by noughts on 2014/08/19.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NNNotificationController.h"

@implementation NNNotificationController{
	__weak id _observer;
	NSHashTable* _observers;
}

+(instancetype)controllerWithObserver:(id)observer{
	return [[self alloc] initWithObserver:observer];
}



- (instancetype)initWithObserver:(id)observer{
	self = [super init];
	if (nil != self) {
		_observer = observer;
		_observers = [NSHashTable weakObjectsHashTable];
		[_observers addObject:observer];
	}
	return self;
}



-(void)dealloc{
	[self unobserveAll];
}


- (id)observeForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *note))block{
	id observer = [[NSNotificationCenter defaultCenter] addObserverForName:name object:obj queue:queue usingBlock:block];
	[_observers addObject:observer];
	return observer;
}

- (void)observeForName:(NSString*)aName object:(id)anObject selector:(SEL)aSelector{
	[[NSNotificationCenter defaultCenter] addObserver:_observer selector:aSelector name:aName object:anObject];
}


-(void)unobserveAll{
	for (id observer in _observers) {
		[[NSNotificationCenter defaultCenter] removeObserver:observer];
	}
	[_observers removeAllObjects];
}




@end
