//
//  MainViewController.h
//  KOM Hunter
//
//  Created by Adam Chamberlin on 18/12/2013.
//  Copyright (c) 2013 Adam Chamberlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MainViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;

- (IBAction)getLocation:(id)sender;
@end
