//
//  Util.m
//  helloworld
//
//  Created by Guo Huang on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Util.h"

@implementation Util
+ (NSString *) getSavedName{
	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
	NSString *savedValue = 	[ud objectForKey:@"TEST"];
	
	return savedValue;
}

@end
