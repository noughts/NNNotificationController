//
//  NNViewController.m
//  NNNotificationController
//
//  Created by Koichi Yamamoto on 02/23/2015.
//  Copyright (c) 2014 Koichi Yamamoto. All rights reserved.
//

#import "ViewController.h"
#import <NNNotificationController.h>

@implementation ViewController{
	NNNotificationController* _notificationCenter;
}

-(void)viewDidLoad{
	[super viewDidLoad];
	
	_notificationCenter = [NNNotificationController controllerWithObserver:self];
	[_notificationCenter observeForName:@"fuga" object:self selector:@selector(handler:)];
	[_notificationCenter observeForName:@"piyo" object:self selector:@selector(handler:)];
//	id observer = [_notificationCenter observeForName:@"piyo" object:self queue:nil usingBlock:^(NSNotification *note) {
//		NSLog( @"%@", note );
//	}];
	[_notificationCenter unobserve:self keyPath:@"piyo"];
}



-(void)handler:(NSNotification*)note{
	NSLog( @"%@", note );
}


-(IBAction)postNotification:(id)sender{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"hoge" object:nil userInfo:nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"fuga" object:self userInfo:nil];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"piyo" object:self userInfo:nil];
}

@end
