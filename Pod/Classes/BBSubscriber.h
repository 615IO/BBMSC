//
//  BBSubscriber.h
//  SchoolReach
//
//  Created by Matthew S Wallace on May/21/14.
//  Copyright (c) 2014 Matthew Wallace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBDataObject.h"

@interface BBSubscriber : NSObject
-(id)initWithDM:(NSObject*)dm;
@end

@protocol BBSubscriber <NSObject>

@required
-(void)update:(BBDataObject*)data;

@optional
- (id)initWithNibAndDM:(NSObject*)dm nibNameOrNil:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
@end
