//
//  BBMSCLoginWithTwitter.m
//  BBMSC
//
//  Created by Matthew S Wallace on August/12/14.
//  Copyright (c) 2014 Matthew Wallace. All rights reserved.
//

#import "BBMSCLoginWithTwitter.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface BBMSCLoginWithTwitter()

@end

@implementation BBMSCLoginWithTwitter

-(id)initWithDM:(BBModel *)dm
{
    self = [super initWithDM:dm];
    
    if (self)
        _dm = (BBMSCMainDM*)dm;
    
    return self;
}

-(void)execute:(NSObject *)args
{
    ACAccountStore *accountStore = (ACAccountStore*)args;
    
    ACAccountType *twitterAccountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [accountStore requestAccessToAccountsWithType:twitterAccountType options:nil completion:^(BOOL granted, NSError *error){
        
        
        if(!error && granted)
        {
            ACAccount *account = [[accountStore accountsWithAccountType:twitterAccountType]lastObject];
            [self result:account];
        }
        
    }];
}

-(void)result:(NSObject *)data
{
    _dm.twitterAccount = (ACAccount*)data;
}

@end
