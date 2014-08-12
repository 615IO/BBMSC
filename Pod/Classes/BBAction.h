//
//  BBDelegate.h
//  SchoolReach
//
//  Created by Matthew S Wallace on July/15/14.
//  Copyright (c) 2014 Matthew Wallace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBModel.h"
@interface BBAction : NSObject

-(id)initWithDM:(BBModel*)dm;
-(void)execute:(NSObject*)args;
-(void)result:(NSObject*)data;
-(void)error:(NSObject*)info;


@end
