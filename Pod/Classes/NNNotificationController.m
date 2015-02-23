//
//  NNNotificationController.m
//  NNNotificationControllerDemo
//
//  Created by noughts on 2014/08/19.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NNNotificationController.h"

@implementation NNNotificationController{
	NSMutableSet* _observers;
}

+(instancetype)controllerWithObserver:(id)observer{
	return [[self alloc] initWithObserver:observer];
}



- (instancetype)initWithObserver:(id)observer{
	self = [super init];
	if (nil != self) {
		_observers = [NSMutableSet new];
	}
	return self;
}


- (id)addObserverForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *note))block{
	id observer = [[NSNotificationCenter defaultCenter] addObserverForName:name object:obj queue:queue usingBlock:block];
	[_observers addObject:observer];
	return observer;
}





-(void)dealloc{
	for (id observer in _observers) {
		[[NSNotificationCenter defaultCenter] removeObserver:observer];
	}
}

@end
