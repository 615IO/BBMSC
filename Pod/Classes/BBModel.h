//
//  BBModel.h
//  Pods
//
//  Created by Matthew S Wallace on March/22/14.
//
//

#import <Foundation/Foundation.h>
#import "BBDataObject.h"
#import "BBSubscriber.h"
@interface BBModel : NSObject

@property(nonatomic,strong)NSMutableArray* views;

-(void)subscribe:(BBSubscriber*)view;
-(void)update:(BBDataObject*)obj;
- (void)unsubscribe:(BBSubscriber*)view;

@end
