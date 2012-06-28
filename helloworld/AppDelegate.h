//
//  AppDelegate.h
//  helloworld
//
//  Created by Guo Huang on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property BOOL isRetina;
@property NSString *GLOBAL_STRING;

- (void)checkScreenType;

@end
