//
//  BBModel.m
//  Pods
//
//  Created by Matthew S Wallace on March/22/14.
//
//

#import "BBModel.h"

@implementation BBModel


//add view to array
-(void)addView:(NSObject*)view
{
    [_views addObject:view];
}

//checks to see if view is already registered
-(BOOL)hasView:(NSObject*)newView
{
    if(_views != nil)
        return [_views containsObject:newView];
    else
        return NO;
}

-(void)subscribe:(BBSubscriber*)view
{
    if(_views == nil)
        _views = [[NSMutableArray alloc] init];
    
    if([self hasView:view] == YES)
        NSLog(@"this subscriber is already subscribed to the model");
    else
        [self addView:view];
}

-(void)update:(BBDataObject*)data
{
    if(_views)
        [_views makeObjectsPerformSelector:@selector(update:) withObject:data];
}

@end
