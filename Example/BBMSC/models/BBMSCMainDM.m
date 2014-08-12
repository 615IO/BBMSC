//
//  BBMSCMainDM.m
//  BBMSC
//
//  Created by Matthew S Wallace on August/12/14.
//  Copyright (c) 2014 Matthew Wallace. All rights reserved.
//

#import "BBMSCMainDM.h"

@implementation BBMSCMainDM


-(void)setTwitterAccount:(ACAccount *)twitterAccount
{
    _twitterAccount = twitterAccount;
    
    BBDataObject *obj = [[BBDataObject alloc]init];
    obj.dataType = TWITTER_ACCOUNT_CHANGED;
    obj.data = _twitterAccount;
    
    [self update:obj];
}

-(void)setFollowers:(NSArray *)followers
{
    _followers = followers;
    
    BBDataObject *obj = [[BBDataObject alloc]init];
    obj.dataType = FOLLOWERS_CHANGED;
    obj.data = _followers;
    
    [self update:obj];
}

-(void)setShowFollowers:(BOOL )showFollowers
{
    _showFollowers = showFollowers;
    
    BBDataObject *obj = [[BBDataObject alloc]init];
    obj.dataType = SHOW_FOLLOWERS_CHANGED;
    obj.data = [NSNumber numberWithBool:_showFollowers];
    
    [self update:obj];
}
@end
