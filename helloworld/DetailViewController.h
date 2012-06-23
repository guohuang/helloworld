//
//  DetailViewController.h
//  helloworld
//
//  Created by Guo Huang on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property NSString *Url;
@end
