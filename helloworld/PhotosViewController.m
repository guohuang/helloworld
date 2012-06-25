//
//  PhotosViewController.m
//  helloworld
//
//  Created by Guo Huang on 6/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotosViewController.h"

@interface PhotosViewController ()

@end

@implementation PhotosViewController
@synthesize photo;
@synthesize scroll;

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
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
	//[self getJsonData];
}

- (void)viewDidUnload
{
	[self setPhoto:nil];
	[self setScroll:nil];
	[super viewDidUnload];
	// Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) getPhotoData{
	NSURL *url = [NSURL URLWithString:@"http://www.flickr.com/services/rest/?method=flickr.groups.pools.getPhotos&group_id=51035641679@N01&format=json&api_key=2aa4ef551c23385d2fadab02c534f77f"];
	NSData *data = [NSData dataWithContentsOfURL:url];
	NSError *error;
	NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
	
	NSLog(@"%@", error);
	
	if (json !=nil) {
		NSLog(@"%@", json);
		
		//		for	(NSDictionary *item in json){
		//			[lblCompanyName setText:	[item objectForKey:@"created_at"]];
		//			[lblCurrentPrice setText: [[item objectForKey:@"user"] objectForKey:@"location"]];
		//			
		//			//NSLog(@"%@", [item objectForKey:@"screen_name"]);
		//			NSLog(@"%@", [item objectForKey:@"user"] );
		//		}
	}
	
}
@end
