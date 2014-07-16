//
//  RanchanThreadItem.m
//  ThreadList
//
//  Created by John Arley Burns on 10/07/14.
//  Copyright (c) 2014 John Arley Burns. All rights reserved.
//

#import "RanchanThreadItem.h"
#import "RanchanTestHarness.h"

@implementation RanchanThreadItem

BOOL TEST_MODE = TRUE;
NSString *THUMB_URL_FORMAT = @"https://ranchan.org/t/%0d.jpg";
NSString *IMAGE_URL_FORMAT = @"https://ranchan.org/i/%0d.jpg";
int const RANCHAN_FLAG_ADULT = 0x1;

-(RanchanThreadItem*)initWithValues:(NSString*)id parentId:(NSString*)parentId content:(NSString*)content nickname:(NSString*)nickname date:(NSDate*)date imageBytes:(int)imageBytes width:(int)width height:(int)height flags:(int)flags chats:(int)chats images:(int)images
{
    self.id = id;
    self.parentId = parentId;
    self.content = content;
    self.nickname = nickname;
    self.date = date;
    self.imageBytes = imageBytes;
    self.width = width;
    self.height = height;
    self.flags = flags;
    self.chats = chats;
    self.images = images;
    return self;
}

-(RanchanThreadItem*)initWithArray:(NSArray*)array
{
    self.id = array[0];
    self.parentId = array[1];
    self.content = array[2];
    self.nickname = array[3];
    self.date = array[4];
    self.imageBytes = [array[5] intValue];
    self.width = [array[6] intValue];
    self.height = [array[7] intValue];
    self.flags = [array[8] intValue];
    self.chats = [array[9] intValue];
    self.images = [array[10] intValue];
    return self;
}

-(BOOL)hasImage
{
    return self.imageBytes > 0 && self.width > 0 && self.height > 0;
}

-(NSString*)thumbUrl
{
    if (![self hasImage]) {
        return nil;
    }
    if (TEST_MODE) {
        return [[[RanchanTestHarness sharedManager] TEST_THUMBS] objectForKey:self.id];
    }
    else {
        return [[NSString alloc] initWithFormat:THUMB_URL_FORMAT, self.id];
    }
}
                
-(NSString*)imageUrl
{
            if (![self hasImage]) {
                return nil;
            }
            if (TEST_MODE) {
                if ([[[RanchanTestHarness sharedManager] TEST_IMAGES] objectForKey:self.id]) {
                    return [[[RanchanTestHarness sharedManager] TEST_IMAGES] objectForKey:self.id];
                }
                else {
                    return [[[RanchanTestHarness sharedManager] TEST_THUMBS] objectForKey:self.id];
                }
            }
            else {
                return [[NSString init] initWithFormat:IMAGE_URL_FORMAT, self.id];
            }
}

@end
