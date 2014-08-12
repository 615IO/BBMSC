//
//  BBMSCLoginViewController.m
//  BBMSC
//
//  Created by Matthew S Wallace on August/12/14.
//  Copyright (c) 2014 Matthew Wallace. All rights reserved.
//

#import "BBMSCLoginViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "BBMSCLoginWithTwitter.h"

@interface BBMSCLoginViewController ()
@property(nonatomic, strong)ACAccountStore *accountStore;
@end

@implementation BBMSCLoginViewController

-(id)initWithNibAndDM:(NSObject *)dm nibNameOrNil:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        _dm = (BBMSCMainDM*)dm;
        [_dm subscribe:(BBSubscriber*)self];
        [self setupAccountStory];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _bnLogin.hidden = NO;
    _bnShowFollowers.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onAccountStoreChanged:) name:ACAccountStoreDidChangeNotification object:nil];
}

-(void)onAccountStoreChanged:(NSNotification*)notification
{
    [self setupAccountStory];
}

-(void)setupAccountStory
{
    _accountStore = [[ACAccountStore alloc]init];
}


-(IBAction)login:(id)sender
{
    BBMSCLoginWithTwitter *action = [[BBMSCLoginWithTwitter alloc]initWithDM:(BBModel*)_dm];
    [action execute:_accountStore];
}


-(IBAction)showFollowers:(id)sender
{
    _dm.showFollowers = YES;
}

-(void)update:(BBDataObject *)data
{
    if (data.dataType == TWITTER_ACCOUNT_CHANGED) {
        _bnLogin.hidden = YES;
        _bnShowFollowers.hidden = NO;
    }
}

@end
