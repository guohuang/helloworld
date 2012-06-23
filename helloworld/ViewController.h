//
//  ViewController.h
//  helloworld
//
//  Created by Guo Huang on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *LblName2;
@property (weak, nonatomic) IBOutlet UITextField *TxtName;
@property (weak, nonatomic) IBOutlet UITableViewCell *tblView;
- (IBAction)ButtonClicked:(id)sender;
//- (IBAction)btnNext:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblCompanyName;
@property (weak, nonatomic) IBOutlet UILabel *lblCurrentPrice;

@end
