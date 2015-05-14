//
//  POCDataSource.m
//  WatchBNR
//
//  Created by Chris Voronin on 5/14/15.
//  Copyright (c) 2015 n/a. All rights reserved.
//

#import "POCDataSource.h"

@implementation POCDataSource

#define KEY @"KEY"

static POCDataSource * shared;

+(POCDataSource*)sharedInstance
{
    @synchronized(shared)
    {
        if (shared == nil)
        {
            shared = [[POCDataSource alloc] init];
        }
    }
    return shared;
}

-(void)saveString:(NSString*)stringToSave
{
    NSUserDefaults *prefs = [self userDefaults];
    
    [prefs setObject:stringToSave forKey:KEY];
    [prefs synchronize];
}

-(NSString*)getString
{
    NSUserDefaults *prefs = [self userDefaults];
    NSString * value = [prefs objectForKey:KEY];
    return value;
}

-(NSUserDefaults*)userDefaults
{
    NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:@"group.brnwatchkit"];
    return prefs;
}


@end
