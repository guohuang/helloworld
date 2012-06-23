//
//  SecondView.m
//  helloworld
//
//  Created by Guo Huang on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import "Util.h"
#import "AppDelegate.h"
@implementation SecondViewController
@synthesize lblCode;
@synthesize btnNext;
@synthesize btnBack;

UIView *dynView;
UIActivityIndicatorView *indc ;
-(IBAction)btnBack:(id)sender{
	[self dismissModalViewControllerAnimated:YES];
}

- (void) loadView
{
	[super loadView];
}

- (void) viewWillAppear:(BOOL)animated
{	
	AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	if(	delegate.isRetina)
		NSLog(@"it is for Retina display");
	else {
		NSLog(@"it is not for Retina display");
	}
	btnBack.hidden = YES;
	//btnNext.hidden = YES;
	[super viewWillAppear:animated];
}

- (void) viewDidAppear:(BOOL)animated
{	
	
	[self performSelector:@selector(myMethod) withObject:nil afterDelay:5.0];
	
	CGRect  viewRect =  CGRectMake(180, 100, 100, 100);
	dynView = [[UIView alloc] initWithFrame:viewRect];
	dynView.backgroundColor = [UIColor grayColor];
	dynView.alpha = 0.5;
	dynView.center = self.view.center;
	
	
	[self.view addSubview:dynView];
	
	UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 100, 30) ];
	[lbl setBackgroundColor:[ UIColor clearColor]];
	lbl.text = @"Loading";
	//lbl.center = dynView.center;
	[dynView addSubview:lbl];
	
	indc	= [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(25, 50, 50, 30)];
	[indc setBackgroundColor :[UIColor clearColor]];
	indc.hidden = NO;
	[indc startAnimating];
	
	[dynView addSubview:indc];
	
	[super viewDidAppear:YES];
}

-(void) myMethod
{
	
	//Loading.hidden = YES;
	dynView.hidden = YES;
	btnBack.hidden = NO;
	btnNext.hidden = NO;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
	
	[self setBtnNext:nil];
	[self setBtnBack:nil];
	[self setLblCode:nil];
	[super viewDidUnload];
	// Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
		return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	} else {
		return YES;
	}
}

- (IBAction)btnAlert:(id)sender {
	//	Util *utilName = [[Util alloc] init];
	
	NSString *msg = [NSString stringWithFormat:@"Saved String : %@", [Util getSavedName] ];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:msg delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
	
	[alert show];
	
}

- (IBAction)btnGenerate:(id)sender {
	
	CFStringRef strGUID = CFUUIDCreateString(nil, CFUUIDCreate(nil));
	
	[lblCode setText: [NSString stringWithFormat:@"%@", strGUID]];
}
@end
