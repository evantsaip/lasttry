//
//  ViewController.h
//  AC-FinalTest
//
//  Created by lalaleelala on 7/29/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *storyBoardImg;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
- (IBAction)randomButton:(id)sender;
- (IBAction)favButton:(id)sender;

@end

