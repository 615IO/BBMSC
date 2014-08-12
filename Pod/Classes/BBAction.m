//
//  BBDelegate.m
//  SchoolReach
//
//  Created by Matthew S Wallace on July/15/14.
//  Copyright (c) 2014 Matthew Wallace. All rights reserved.
//

#import "BBAction.h"

@implementation BBAction: NSObject

-(id)initWithDM:(BBModel*)dm{ self = [super init]; return self;}
-(void)execute:(NSObject*)args{}
-(void)result:(NSObject*)data{}
-(void)error:(NSObject*)info{}
@end
