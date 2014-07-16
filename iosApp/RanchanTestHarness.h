//
//  RanchanTestHarness.h
//  iosApp
//
//  Created by John Arley Burns on 11/07/14.
//  Copyright (c) 2014 Chanapps Software LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RanchanTestHarness : NSObject

@property (nonatomic, retain) NSDictionary *TEST_THUMBS;
@property (nonatomic, retain) NSDictionary *TEST_IMAGES;

+(id)sharedManager;

-(void)addTestItems:(NSMutableArray*)threadItems;

@end
