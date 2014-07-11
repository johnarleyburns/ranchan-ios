//
//  RanchanThreadItem.h
//  ThreadList
//
//  Created by John Arley Burns on 10/07/14.
//  Copyright (c) 2014 John Arley Burns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RanchanThreadItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
