//
//  PictureViewController.h
//  helloworld
//
//  Created by Guo Huang on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureViewController : UIViewController
{
NSMutableArray  *photoURLsLargeImage;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end
