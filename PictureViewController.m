//
//  PictureViewController.m
//  helloworld
//
//  Created by Guo Huang on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PictureViewController.h"

@interface PictureViewController ()

@end

@implementation PictureViewController
@synthesize scrollView;

const CGFloat kScrollObjHeight	= 480.0;
const CGFloat kScrollObjWidth	= 320.0;

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
	[self getPhotoData];
	[self propulateImages];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
	[self setScrollView:nil];
	[super viewDidUnload];
	// Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) propulateImages
{
	
	scrollView.pagingEnabled = TRUE;
	
	//NSLog(@"%@", photoURLsLargeImage);
	if(photoURLsLargeImage !=nil){
		
		for (int i=0; i< photoURLsLargeImage.count; i++) {
			
			
			NSData *imageData = [photoURLsLargeImage objectAtIndex:i];
			
			//NSLog(@"%@", imageData);
			
			UIImage *img = [[UIImage alloc] initWithData:imageData];
			UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
			CGRect rect = imageView.frame;
			rect.size.height = kScrollObjHeight;
			rect.size.width = kScrollObjWidth;
			imageView.frame = rect;
			imageView.tag = i;
			
			[scrollView addSubview:imageView];
		}
	[self layoutScrollImages];
}

}

- (void)layoutScrollImages
{
	UIImageView *view = nil;
	NSArray *subviews = [scrollView subviews];
	
	// reposition all image subviews in a horizontal serial fashion
	CGFloat curXLoc = 0;
	for (view in subviews)
	{
		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
		{
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 0);
			view.frame = frame;
			
			curXLoc += (kScrollObjWidth);
		}
	}
	
	
	// set the content size so it can be scrollable
	[scrollView setContentSize:CGSizeMake((photoURLsLargeImage.count * kScrollObjWidth), [scrollView bounds].size.height)];
}
- (void) getPhotoData{
	NSURL *url = [NSURL URLWithString:@"http://www.flickr.com/services/rest/?method=flickr.groups.pools.getPhotos&group_id=51035641679@N01&format=json&nojsoncallback=1&api_key=2aa4ef551c23385d2fadab02c534f77f"];
	NSData *data = [NSData dataWithContentsOfURL:url];
	NSError *error;
	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
	
	NSLog(@"%@", error);
	
	if (json !=nil) {
		//NSLog(@"%@", json);
		int i = 0;
		//NSLog(@"%@", [[json objectForKey:@"photos"] objectForKey:@"photo"] );
		for	(NSDictionary *photo in [[json objectForKey:@"photos"] objectForKey:@"photo"] ){			
			//NSLog(@"%@", [item objectForKey:@"id"]);
			
			NSString *photoURLString = 
			[NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_m.jpg", 
			 [photo objectForKey:@"farm"], [photo objectForKey:@"server"], 
			 [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];
			i++;
			[self getPictureById: photoURLString];
			
			if(i == 10)
				break;
		}
	}
	
}

- (void) getPictureById: (NSString *) pictureUrl
{
	if(photoURLsLargeImage == nil)
		photoURLsLargeImage = [[NSMutableArray alloc] init];
	
	NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString: pictureUrl]];
	
	[photoURLsLargeImage addObject: data]; 
}
@end
