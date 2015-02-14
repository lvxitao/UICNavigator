//
//  DestinationViewController.h
//  CmapusNavigation
//
//  Created by Xitao Lv on 1/31/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "RouteViewController.h"
#import "NewViewController.h"
#import "Place.h"
#import "GoogleViewController.h"
#import "Infomation.h"

@interface DestinationViewController : UIViewController<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *BuildingView;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *destination;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *campus;

@property (strong, nonatomic) NSString *campusString;
@property (strong, nonatomic) NSString *titleString;
@property (strong, nonatomic) NSString *addressString;
@property (strong, nonatomic) NSString *imageString;
@property (strong, nonatomic) NSNumber *numberLa;
@property (strong, nonatomic) NSNumber *numberLong;
@property (weak, nonatomic) IBOutlet UIView *popUp;
- (IBAction)direction:(id)sender;
- (IBAction)Pclose:(id)sender;
- (IBAction)GmapOpen:(id)sender;


@end
