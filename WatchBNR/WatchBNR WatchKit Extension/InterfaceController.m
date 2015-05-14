//
//  InterfaceController.m
//  WatchBNR WatchKit Extension
//
//  Created by Chris Voronin on 5/14/15.
//  Copyright (c) 2015 n/a. All rights reserved.
//

#import "InterfaceController.h"
#import "POCDataSource.h"


@interface InterfaceController()
{
    NSTimer *_updateTimer;
}
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *lblPlainText;
- (IBAction)buttonPressed;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    _updateTimer = [NSTimer scheduledTimerWithTimeInterval:10.f
                                                    target:self
                                                  selector:@selector(getDataFromPhone)
                                                  userInfo:nil
                                                   repeats:TRUE];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    
    [_updateTimer invalidate];
}

- (IBAction)buttonPressed {
    
    //TODO: Send something back to the app.
    //And possibly get something in return.
    [self loadLabelData];
    
}


-(void)loadLabelData
{
    NSString * text = [POCDataSource sharedInstance].getString;
    
    [self.lblPlainText setText:text];
}

-(void)getDataFromPhone
{
    [WKInterfaceController openParentApplication:@{@"request":@"mystring"}
                                           reply:^(NSDictionary *replyInfo, NSError *error) {
                                               
                                               // the request was successful
                                               if(error != nil) {
                                                   return;
                                               }
                                               
                                               // get the serialized location object
                                               NSString *myString = replyInfo[@"mystring"];
                                               [self.lblPlainText setText:myString];
                                           }];
}

@end



