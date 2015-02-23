//
//  NNViewController.m
//  NNNotificationController
//
//  Created by Koichi Yamamoto on 02/23/2015.
//  Copyright (c) 2014 Koichi Yamamoto. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

-(IBAction)postNotification:(id)sender{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"hoge" object:nil userInfo:nil];
}

@end
