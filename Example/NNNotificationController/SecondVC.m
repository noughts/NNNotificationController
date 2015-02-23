//
//  SecondVC.m
//  NNNotificationControllerDemo
//
//  Created by noughts on 2014/08/19.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "SecondVC.h"
#import <NNNotificationController.h>

@implementation SecondVC{
	NNNotificationController* _notificationController;
}

-(void)awakeFromNib{
	[super awakeFromNib];
	
	_notificationController = [NNNotificationController controllerWithObserver:self];
	
	[_notificationController addObserverForName:@"hoge" object:nil queue:nil usingBlock:^(NSNotification *note) {
		NSLog( @"%@", note );
	}];
	
	[_notificationController addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
		NSLog( @"block -> %@", note );
	}];
	
	[_notificationController addObserver:self selector:@selector(hoge:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

-(void)dealloc{
	NSLog( @"dealloc" );
}


-(void)hoge:(NSNotification*)note{
	NSLog( @"selector -> %@", note );
}





@end
