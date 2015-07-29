//
//  ViewController.m
//  AC-FinalTest
//
//  Created by lalaleelala on 7/29/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "Singleton.h"

@interface ViewController ()
{
    int a;
    int b;
    int memoryPic;
    int checkTime;
    NSMutableArray *picStorage[4];
    
}

@property (strong,nonatomic) NSMutableArray *profileInfo;
@property (strong,nonatomic) NSMutableArray *profileEmail;
@property (strong,nonatomic) NSMutableArray *profileImg;
@property (strong,nonatomic) NSMutableArray *imgBox;
@property (strong,nonatomic) NSMutableArray *myPicture;
@property (strong,nonatomic) NSMutableArray *arrayPic;
@property (readonly, copy) NSString *name;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    _myPicture = [[NSMutableArray alloc]init];
    [self getData];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)getData {
    PFQuery *query = [PFQuery queryWithClassName:@"Profile"];
    _profileInfo = [[NSMutableArray alloc]init];
    _profileEmail = [[NSMutableArray alloc]init];
    _profileImg = [[NSMutableArray alloc]init];
    [query findObjectsInBackgroundWithBlock:^(NSArray *arrResult, NSError *error) {
        for (PFObject *obj in arrResult) {
            [_profileInfo addObject:obj[@"info"]];
            [_profileEmail addObject:obj[@"email"]];
            PFFile *pfFile = obj[@"profileImage"];
            [pfFile getDataInBackgroundWithBlock:^(NSData *imgData, NSError *error) {
                UIImage *img = [UIImage imageWithData:imgData];
                [_myPicture addObject:img];
              }];
        }
    }];
}

- (IBAction)randomButton:(id)sender {
    

    a = arc4random()%15;
    memoryPic = a;
    b = arc4random()%15;
    _emailLabel.text =  _profileEmail[a];
    _infoLabel.text = _profileInfo[a];
    _storyBoardImg.image = _myPicture[a] ;

    CATransition *transition = [CATransition animation];
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction
                                 functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    [_storyBoardImg removeFromSuperview];
    [self.view addSubview:_storyBoardImg];
    [self.view.layer addAnimation:transition forKey:nil];
    
    
    
}




- (IBAction)favButton:(id)sender {

}











@end
