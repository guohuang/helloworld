//
//  SecondView.h
//  helloworld
//
//  Created by Guo Huang on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Util.h"
@interface SecondViewController : UIViewController

-(IBAction)btnBack:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
- (IBAction)btnAlert:(id)sender;
- (IBAction)btnGenerate:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblCode;

@end
