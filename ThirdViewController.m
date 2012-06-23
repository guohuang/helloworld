//
//  ThirdViewController.m
//  helloworld
//
//  Created by Guo Huang on 6/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ThirdViewController.h"
#import "DetailViewController.h"
@interface ThirdViewController ()

@end

NSArray *myDatasource;

@implementation ThirdViewController
@synthesize toolbar;


- (id)initWithStyle:(UITableViewStyle)style
{
	self = [super initWithStyle:style];
	if (self) {
		// Custom initialization
		
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	//myArray = [[NSMutableArray alloc] initWithObjects:@"Red",@"Green",@"Yellow", nil];
	
	myDatasource = [self getJsonData];
	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;
	
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
	
	[self setToolbar:nil];
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	
	// Return the number of sections.
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	// Return the number of rows in the section.
	return [myDatasource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if(cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
		
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		
		//[cell performSelector:@selector(cellSelected) withObject:nil];
		
	}
	// Configure the cell...
	//cell.textLabel.text = @"xxx";
	NSDictionary *rowData = [myDatasource objectAtIndex:indexPath.row];
	cell.textLabel.text = [rowData objectForKey:@"name"];
	return cell;
}

- (void) cellSelected{
	
	NSLog(@"raised event");
	
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Navigation logic may go here. Create and push another view controller.
	UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone"
																								bundle:nil];
	
	DetailViewController *vc = [sb instantiateViewControllerWithIdentifier:@"twitterDetailView"];
	NSDictionary *rowData = [myDatasource objectAtIndex:indexPath.row];
	
	vc.Url = [rowData objectForKey:@"url"];
	
	//DetailViewController *dvc = [[DetailViewController alloc] init;
	//NSLog(@"%@", vc);
	
	//navController = [[UINavigationController alloc] initWithRootViewController:self];
	//[navController pushViewController:vc animated:YES];
	// Pass the selected object to the new view controller.
	
	
	[self.navigationController pushViewController:vc animated:YES];
	
	//[self performSegueWithIdentifier:@"detail" sender:self];
	
	//NSLog(@"%@", self.navigationController);
}

- (IBAction)btnBackClick:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
	
}

- (NSArray *) getJsonData{
	
	NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1/trends/1.json"];
	NSData *data = [NSData dataWithContentsOfURL:url];
	NSError *error;
	NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
	
	NSLog(@"%@", error);
	NSLog(@"%@", json);
	if (json !=nil) {
		NSLog(@"%@",[json objectAtIndex:0]);
		return [[json objectAtIndex:0] objectForKey: @"trends"];
	}
	return nil;
}
@end
