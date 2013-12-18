//
//  MainViewController.m
//  KOM Hunter
//
//  Created by Adam Chamberlin on 18/12/2013.
//  Copyright (c) 2013 Adam Chamberlin. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () {
    CLLocationManager *locationManager;
}

@end

@implementation MainViewController

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    locationManager = [[CLLocationManager alloc] init];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    if (locations != nil) {
        CLLocation *location = [locations lastObject];
        self.latitudeLabel.text = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
        self.longitudeLabel.text = [NSString stringWithFormat:@"%f", location.coordinate.longitude];
        [locationManager stopUpdatingLocation];
    }
    NSLog(@"Locations %@", locations);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                         message:@"Failed to Get Your Location"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
    [errorAlert show];
}

#pragma mark - IBActions

- (IBAction)getLocation:(id)sender {
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
}
@end
