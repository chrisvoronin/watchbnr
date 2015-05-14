//
//  POCDataSource.h
//  WatchBNR
//
//  Created by Chris Voronin on 5/14/15.
//  Copyright (c) 2015 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface POCDataSource : NSObject

+(POCDataSource*)sharedInstance;

-(void)saveString:(NSString*)stringToSave;

-(NSString*)getString;

@end
