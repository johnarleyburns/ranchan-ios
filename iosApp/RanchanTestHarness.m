//
//  RanchanTestHarness.m
//  iosApp
//
//  Created by John Arley Burns on 11/07/14.
//  Copyright (c) 2014 Chanapps Software LLC. All rights reserved.
//

#import "RanchanTestHarness.h"
#import "RanchanThreadItem.h"

@implementation RanchanTestHarness

@synthesize TEST_THUMBS;
@synthesize TEST_IMAGES;

+(id)sharedManager
{
    static RanchanTestHarness *sharedHarness = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHarness = [[self alloc] init];
    });
    return sharedHarness;
}

-(id)init {
    if (self = [super init]) {
        TEST_THUMBS = @{
                        @"7cd91383-6b8b-4432-a5fc-a06d63d561cd": // 665x396
                        @"https://upload.wikimedia.org/wikipedia/commons/5/54/Solitude_%281894076214%29.jpg",
                        
                        @"a8364469-3167-4573-b4c3-594d8bcb327e": //240x240
                        @"https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Figure_in_Manga_style_variation_1.png/240px-Figure_in_Manga_style_variation_1.png",
                        
                        @"286d6398-a9fa-4f19-aa11-c58888d798b7": // 320x214
                        @"https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Protesters_on_the_barricades%2C_seen_through_the_lights_of_fire_built._Euromaidan_Protests.jpg/320px-Protesters_on_the_barricades%2C_seen_through_the_lights_of_fire_built._Euromaidan_Protests.jpg",
                        
                        @"c96222a1-da6c-44b0-86c6-5fe17ddb41e8": // 320x213
                        @"https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Porsche.jpg/320px-Porsche.jpg",
                        
                        @"19f13dc4-91cf-476a-9215-d76fe024e956": // 320x240
                        @"https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Tremendo_gordo.jpg/320px-Tremendo_gordo.jpg",
                        
                        @"8cdd1917-e37b-4385-b777-123c0017e123": // 161x240
                        @"https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Black_woman_dancing_%281634389290%29.jpg/161px-Black_woman_dancing_%281634389290%29.jpg",
                        
                        @"2aeafc10-891b-499d-b806-85f14c72a8af": // 200x200
                        @"https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Flag_of_Islamic_State_of_Iraq.svg/200px-Flag_of_Islamic_State_of_Iraq.svg.png",
                        
                        @"ae748873-2ab2-4efe-a546-9024ccf760af": // 165x240
                        @"https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Anime_girl_at_beach.jpg/165px-Anime_girl_at_beach.jpg",
                        
                        @"a2b18964-8b93-4074-a3a0-f56dfa180d68": // 528x396
                        @"https://upload.wikimedia.org/wikipedia/commons/3/3c/Graffiti_Here_Please.jpg",
                        
                        @"f2b46979-13f5-4357-8379-bc4d4fc38a2e": // 160x240
                        @"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Topless_woman_walking_on_Coral_Beach%2C_Jamaica.jpg/160px-Topless_woman_walking_on_Coral_Beach%2C_Jamaica.jpg",
                        
                        @"8b67d0c3-d7f0-4c0c-b6f9-66d5d3e3081b": // 192x240
                        @"https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Sven_Melander.jpg/192px-Sven_Melander.jpg",
                        
                        @"7914c43c-2147-46c8-adda-ab21466b9f86": // 320x240
                        @"https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Dota-juku_01.JPG/320px-Dota-juku_01.JPG",
                        
                        @"6cef17c6-9719-486a-8535-97f2e4921122": // 307x578
                        @"https://upload.wikimedia.org/wikipedia/commons/c/c3/Chavosh.jpg"
        
                        };
        
        TEST_IMAGES = @{
                        
                        @"7914c43c-2147-46c8-adda-ab21466b9f86": // 3072x2304
                        @"https://upload.wikimedia.org/wikipedia/commons/4/4b/Dota-juku_01.JPG"
                        
                        };
    
    }
    return self;
}

-(void)addTestItems:(NSMutableArray*)threadItems
{
    /*
    RanchanThreadItem *item = [[RanchanThreadItem alloc] init];
    item.content = @"what anime should i watch?"; // \ndont say boku no pico lol\ni like naruto and one piece so something\ngood like that pls"; // 14p 4i
    item.chats = 14;
    item.date = [[NSDate alloc] init];
    [threadItems addObject:item];
    
    item = [[RanchanThreadItem alloc] init];
    item.content = @"How can you tell if someone is unemployed? List all the telltale signs.";
    item.chats = 128;
    NSTimeInterval hour = 60 * 60;
    item.date = [[NSDate alloc] initWithTimeIntervalSinceNow:-hour];
    [threadItems addObject:item]; // 128p 12r
    
    item = [[RanchanThreadItem alloc] init];
    item.content = @"23 decides what I say to these tumblr fags sitting next to me.";
    item.chats = 23;
    NSTimeInterval halfDay = 12 * 60 * 60;
    item.date = [[NSDate alloc] initWithTimeIntervalSinceNow:-halfDay];
    [threadItems addObject:item]; //23p 2r

    item = [[RanchanThreadItem alloc] init];
    item.content = @"grzegorz: wtf how do i pronunce?";
    item.chats = 0;
    NSTimeInterval week = 7 * 24 * 60 * 60;
    item.date = [[NSDate alloc] initWithTimeIntervalSinceNow:-week];
    [threadItems addObject:item]; //0p 0r
    */
    
    RanchanThreadItem *item = [[RanchanThreadItem alloc] init];
    item.id = @"7cd91383-6b8b-4432-a5fc-a06d63d561cd";
    item.parentId = nil;
    item.content = @"Hey it was my birthday yesterday so I got a new 1tb hard drive which I'm going to dedicate to all my games meaning I need to reinstall my games, plus I got a bunch of money to spend on new games so give me some good recommendation";
    item.nickname = @"moot";
    item.date = [[NSDate alloc] initWithTimeIntervalSinceNow:-(NSTimeInterval)1*60*60];
    item.imageBytes = 134134;
    item.width = 665;
    item.height = 396;
    item.flags = 0;
    item.chats = 187;
    item.images = 32;
    [threadItems addObject:item];


    [threadItems addObject:[[RanchanThreadItem alloc]
                            initWithValues:@"a8364469-3167-4573-b4c3-594d8bcb327e"
                            parentId:nil
                            content:@"No waifu thread?  I shall correct that."
                            nickname: nil
                            date: [[NSDate alloc] initWithTimeIntervalSinceNow:-(NSTimeInterval)2*60*60]
                            imageBytes:33123
                            width:240
                            height:240
                            flags:0
                            chats:45
                            images:17
                            ]];
 
    NSArray* testArray = @[
                           @[@"286d6398-a9fa-4f19-aa11-c58888d798b7", [NSNull null], @"Ukraine is burning.  Let's celebrate.", [NSNull null], [[NSDate alloc] initWithTimeIntervalSinceNow:-(NSTimeInterval)8*60*60], @34234, @320, @214, @0, @132, @12],
                            @[@"c96222a1-da6c-44b0-86c6-5fe17ddb41e8", [NSNull null], @"Porsche thread?  Porsche thread.", @"speedygreg", [[NSDate alloc] initWithTimeIntervalSinceNow:-(NSTimeInterval)16*60*60], @454532, @320, @213, @0, @53, @46],
                            @[@"19f13dc4-91cf-476a-9215-d76fe024e956", [NSNull null], @"hawt bods", [NSNull null], [[NSDate alloc] initWithTimeIntervalSinceNow:-(NSTimeInterval)32*60*60], @212423, @320, @240, @0, @5, @3],
                           @[@"8cdd1917-e37b-4385-b777-123c0017e123", [NSNull null], @"black chicks", [NSNull null], [[NSDate alloc] initWithTimeIntervalSinceNow:-(NSTimeInterval)32*60*60], @235455, @161, @240, [[NSNumber alloc] initWithInt:RANCHAN_FLAG_ADULT], @78, @52],
                           @[@"2aeafc10-891b-499d-b806-85f14c72a8af", [NSNull null], @"ISIL ftw!", @"derka derka", [[NSDate alloc] initWithTimeIntervalSinceNow:-(NSTimeInterval)64*60*60], @12353, @200, @200, @0, @3, @1],
                           @[@"ae748873-2ab2-4efe-a546-9024ccf760af", [NSNull null], @"Yotsuba goes to the beach, the latest manga is out, I'm dumping all 200 pages here... enjoy!", [NSNull null], [[NSDate alloc] initWithTimeIntervalSinceNow:-(NSTimeInterval)128*60*60], @1343234, @165, @240, @0, @85, @83],
                           @[@"a2b18964-8b93-4074-a3a0-f56dfa180d68", [NSNull null], @"Please post in my thread.", [NSNull null], [[NSDate alloc] initWithTimeIntervalSinceNow:-(NSTimeInterval)256*60*60], @23423, @528, @396, @0, @0, @0],
                           @[@"f2b46979-13f5-4357-8379-bc4d4fc37a2e", [NSNull null], @"Let's talk about meditation.  Lately I've been eating only fruits and vegetables and meditating, is this going to give me superpowers?", [NSNull null], [[NSDate alloc] initWithTimeIntervalSinceNow:-(NSTimeInterval)512*60*60], @0, @0, @0, @0, @38, @0],
                           @[@"f2b46979-13f5-4357-8379-bc4d4fc38a2e", [NSNull null], @"Bikini thread", [NSNull null],[[NSDate alloc] initWithTimeIntervalSinceNow:-(NSTimeInterval)1024*60*60], @234892, @160, @240, [[NSNumber alloc] initWithInt:RANCHAN_FLAG_ADULT], @167, @150]
                           ];
    
    for (id o in testArray)
    {
        [threadItems addObject:[[RanchanThreadItem alloc] initWithArray:o]];
    }
    
}

@end
