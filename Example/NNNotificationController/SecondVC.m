//
//  SecondVC.m
//  NNNotificationControllerDemo
//
//  Created by noughts on 2014/08/19.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "SecondVC.h"
#import <NNNotificationController.h>
#import <NBULog.h>

@implementation SecondVC{
	NNNotificationController* _notificationController;
}

-(void)awakeFromNib{
	[super awakeFromNib];
	
	_notificationController = [NNNotificationController controllerWithObserver:self];
	
	[_notificationController observeForName:@"hoge" object:nil queue:nil usingBlock:^(NSNotification *note) {
		NBULogInfo( @"%@", note );
	}];
	
	[_notificationController observeForName:UIApplicationDidBecomeActiveNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
		NBULogInfo( @"block -> %@", note );
	}];
	
	[_notificationController observeForName:UIApplicationDidBecomeActiveNotification object:nil selector:@selector(hoge:)];
}

-(void)dealloc{
	NBULogVerbose( @"dealloc" );
}


-(void)hoge:(NSNotification*)note{
	NBULogInfo( @"selector -> %@", note );
}





@end
