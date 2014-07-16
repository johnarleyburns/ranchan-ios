//
//))RanchanThreadItem.h
//))ThreadList
//
//))Created)by)John)Arley)Burns)on)10/07/14.
//))Copyright)(c))2014)John)Arley)Burns.)All)rights)reserved.
//

#import <Foundation/Foundation.h>
#import "RanchanThreadItemModel.h"

extern int const RANCHAN_FLAG_ADULT;

@interface RanchanThreadItem:RanchanThreadItemModel

-(RanchanThreadItem*)initWithValues:(NSString*)id parentId:(NSString*)parentId content:(NSString*)content nickname:(NSString*)nickname date:(NSDate*)date imageBytes:(int)imageBytes width:(int)width height:(int)height flags:(int)flags chats:(int)chats images:(int)images;

-(RanchanThreadItem*)initWithArray:(NSArray*)array;

-(BOOL)hasImage;
-(NSString*)thumbUrl;
-(NSString*)imageUrl;

@end
