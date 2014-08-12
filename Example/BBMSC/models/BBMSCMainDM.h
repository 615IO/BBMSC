//
//  BBMSCMainDM.h
//  BBMSC
//
//  Created by Matthew S Wallace on August/12/14.
//  Copyright (c) 2014 Matthew Wallace. All rights reserved.
//

#import "BBModel.h"
#import <Accounts/Accounts.h>

#define TWITTER_ACCOUNT_CHANGED 0
#define FOLLOWERS_CHANGED 1
#define SHOW_FOLLOWERS_CHANGED 2

@interface BBMSCMainDM : BBModel

@property(nonatomic, strong)ACAccount *twitterAccount;
@property(nonatomic, strong)NSArray *followers;
@property(nonatomic, assign)BOOL showFollowers;
@end
