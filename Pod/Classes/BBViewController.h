//
//  BBViewController.h
//  Blip
//
//  Created by Matthew S Wallace on March/22/14.
//  Copyright (c) 2014 Matthew Wallace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBDataObject.h"
#import "BBSubscriber.h"
@interface BBViewController : UIViewController <BBSubscriber>

- (id)initWithNibandDM:(NSObject*)dm nibNameOrNil:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
-(void)update:(BBDataObject*)obj;

@end
