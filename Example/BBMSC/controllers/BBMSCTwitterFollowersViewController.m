//
//  BBMSCTwitterFollowersViewController.m
//  BBMSC
//
//  Created by Matthew S Wallace on August/12/14.
//  Copyright (c) 2014 Matthew Wallace. All rights reserved.
//

#import "BBMSCTwitterFollowersViewController.h"
#import "BBMSCGetTwitterFollowers.h"

@interface BBMSCTwitterFollowersViewController ()

@end

@implementation BBMSCTwitterFollowersViewController

-(id)initWithNibAndDM:(NSObject *)dm nibNameOrNil:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _dm = (BBMSCMainDM*)dm;
        [_dm subscribe:self];
    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Twitter Followers";
    
    [self getTwitterFollowers];
}

- (void)getTwitterFollowers
{
    BBMSCGetTwitterFollowers *action = [[BBMSCGetTwitterFollowers alloc]initWithDM:(BBModel*)_dm];
    [action execute:_dm.twitterAccount];
}


#pragma tableview delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return _followersArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellName];
    
    NSDictionary *followerData = [_followersArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = followerData[@"screen_name"];
    cell.detailTextLabel.text = followerData[@"description"];
    
    UIImage *defaultAvatar = [UIImage imageNamed:@"twitter_avitar.jpg"];
    cell.imageView.image = defaultAvatar;
    
    NSURL *avatarUrl = [[NSURL alloc]initWithString:followerData[@"profile_image_url"]];
    
    [cell.imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:avatarUrl]]];
    
    
    return cell;
}


#pragma - BB update
-(void)update:(BBDataObject *)data
{
    if (data.dataType == FOLLOWERS_CHANGED) {
        _followersArray = (NSArray*)data.data;
        [_tableView reloadData];
    }
}

@end
