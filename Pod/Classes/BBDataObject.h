//
//  BBDataObject.h
//  Pods
//
//  Created by Matthew S Wallace on March/22/14.
//
//

#import <Foundation/Foundation.h>

@interface BBDataObject : NSObject

@property (assign)int dataType;
@property (nonatomic, strong)NSObject *data;
@end
