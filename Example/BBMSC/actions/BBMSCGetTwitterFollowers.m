//
//  BBMSCGetTwitterFollowers.m
//  BBMSC
//
//  Created by Matthew S Wallace on August/12/14.
//  Copyright (c) 2014 Matthew Wallace. All rights reserved.
//

#import "BBMSCGetTwitterFollowers.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@implementation BBMSCGetTwitterFollowers

-(id)initWithDM:(BBModel *)dm
{
    self = [super initWithDM:dm];
    
    if(self)
        _dm = (BBMSCMainDM*)dm;
    
    return self;
    
}

-(void)execute:(NSObject *)args
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    ACAccount *account = (ACAccount*)args;
    
    NSURL *url = [[NSURL alloc]initWithString:@"https://api.twitter.com/1.1/followers/list.json"];
    
    id params = @{@"skip_status":@"0", @"screen_name": @"matthewswallace", @"count": @"100"};
    
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                            requestMethod:SLRequestMethodGET URL:url parameters:params];
    
    request.account = account;
    
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error){
        if (responseData) {
            if (urlResponse.statusCode >= 200 && urlResponse.statusCode < 300) {
                NSError *jsonError = nil;
                NSDictionary *followerData = [NSJSONSerialization JSONObjectWithData:responseData
                                                                             options:NSJSONReadingAllowFragments
                                                                               error:&jsonError];
                if (followerData) {
                    [self result:followerData];
                } else {
                    NSLog(@"JSON Parsing error: %@", jsonError);
                }
            } else {
                NSLog(@"Server returned HTTP %d", urlResponse.statusCode);
            }
        } else {
            NSLog(@"Something went wrong: %@", [error localizedDescription]);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    }];
}

-(void)result:(NSObject *)data
{
    _dm.followers = ((NSDictionary*)data)[@"users"];
}


@end
