//
//  BBMSCTwitterFollowersViewController.h
//  BBMSC
//
//  Created by Matthew S Wallace on August/12/14.
//  Copyright (c) 2014 Matthew Wallace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBMSCMainDM.h"
#import "BBSubscriber.h"

@interface BBMSCTwitterFollowersViewController : UIViewController <BBSubscriber, UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)BBMSCMainDM *dm;
@property(nonatomic, strong)NSArray *followersArray;

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
