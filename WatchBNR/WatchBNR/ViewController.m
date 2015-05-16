//
//  ViewController.m
//  WatchBNR
//
//  Created by Chris Voronin on 5/14/15.
//  Copyright (c) 2015 n/a. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
- (IBAction)buttonPressed:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeNone|UIUserNotificationTypeSound categories:nil]];
    }
    
    //data that we are sending.
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"DataToSend"
                                                         forKey:@"customKey"];
    
    // in seconds from now
    NSDate * whenToFire = [NSDate dateWithTimeIntervalSinceNow:10];
    
    // sends local notification
    // just once, no repeat.
    UIApplication *application = [UIApplication sharedApplication];
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    //notification.repeatInterval = NSCalendarUnitMinute;
    [notification setAlertBody:@"Hello world 123"];
    [notification setAlertTitle:@"title"];
    [notification setFireDate:whenToFire];
    [notification setTimeZone:[NSTimeZone  defaultTimeZone]];
    [notification setUserInfo:infoDict];
    [notification setCategory:@"myCategory"];
    [application setScheduledLocalNotifications:[NSArray arrayWithObject:notification]];
    
}
@end
