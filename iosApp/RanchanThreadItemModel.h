//
//  RanchanThreadItemModel.h
//  iosApp
//
//  Created by John Arley Burns on 12/07/14.
//  Copyright (c) 2014 Chanapps Software LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RanchanThreadItemModel : NSObject

//@property NSString *content;
//@property int chats;
//@property NSDate *date;

@property NSString *id;
@property NSString *parentId;
@property NSString *content;
@property NSString *nickname;
@property NSDate *date;
@property int imageBytes;
@property int width;
@property int height;
@property int flags;
@property int chats;
@property int images;

@property BOOL completed;

@end
