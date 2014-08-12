//
//  BBMSCLoginViewController.h
//  BBMSC
//
//  Created by Matthew S Wallace on August/12/14.
//  Copyright (c) 2014 Matthew Wallace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBSubscriber.h"
#import "BBMSCMainDM.h"

@interface BBMSCLoginViewController : UIViewController <BBSubscriber>


@property(nonatomic, strong)BBMSCMainDM *dm;
@property (strong, nonatomic) IBOutlet UIButton *bnShowFollowers;
@property (strong, nonatomic) IBOutlet UIButton *bnLogin;

-(IBAction)login:(id)sender;
-(IBAction)showFollowers:(id)sender;
@end
