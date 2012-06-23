//
//  ViewController.m
//  helloworld
//
//  Created by Guo Huang on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lblCompanyName;
@synthesize lblCurrentPrice;
@synthesize LblName2;
@synthesize TxtName;
@synthesize tblView;

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
	NSString *savedValue = 	[ud objectForKey:@"TEST"];
	
	if(savedValue != nil)
		LblName2.text = savedValue;
	
	//[self getJsonData];
}

- (void)viewDidUnload
{
	[self setTxtName:nil];
	[self setLblName2:nil];
	[self setTblView:nil];
	[self setLblCompanyName:nil];
	[self setLblCurrentPrice:nil];
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


- (IBAction)ButtonClicked:(id)sender {
	NSString *output = Nil;
	output = [[NSString alloc] initWithFormat: @"%@ says: hello world, %@, %i", TxtName.text,@"HHH",100];
	LblName2.text = output;
	[LblName2 setTextColor:[UIColor yellowColor]];
	[TxtName resignFirstResponder];
	
	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
	[ud setObject:output forKey:@"TEST"];
	[ud synchronize];
	
	//	[tblView setValue:<#(id)#> forKey:<#(NSString *)#>];
	//	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	//	UIButton *btn = [UIButton new];
	//	[button addTarget:<#(id)#> action:<#(SEL)#> forControlEvents:];
	
	
	//	[TxtName setText:@"xxx"];
	//	TxtName.text = @"xxx";
}

//- (IBAction)btnNext:(id)sender {
//	UIView *iv = [[UIView alloc] init];

//	self.view = iv;
//}

- (void) getJsonData{
	NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=guohuang&count=1"];
	NSData *data = [NSData dataWithContentsOfURL:url];
	NSError *error;
	NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
	
	NSLog(@"%@", error);
	
	if (json !=nil) {
		for	(NSDictionary *item in json){
			[lblCompanyName setText:	[item objectForKey:@"created_at"]];
			[lblCurrentPrice setText: [[item objectForKey:@"user"] objectForKey:@"location"]];
			
			//NSLog(@"%@", [item objectForKey:@"screen_name"]);
			NSLog(@"%@", [item objectForKey:@"user"] );
		}
	}
	
}
@end
