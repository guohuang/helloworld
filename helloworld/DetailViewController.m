//
//  DetailViewController.m
//  helloworld
//
//  Created by Guo Huang on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize webview;
@synthesize Url;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
	NSLog(@"%@", Url);
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	[self loadWebsite];
}

- (void)viewDidUnload
{
	[self setWebview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) loadWebsite
{
	NSURL *siteUrl = [[NSURL alloc] initWithString:Url];
	
	NSURLRequest *requestUrl = [[NSURLRequest alloc] initWithURL:siteUrl];
	[webview loadRequest:requestUrl];
}
@end
