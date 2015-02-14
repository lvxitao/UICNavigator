//
//  GoogleViewController.h
//  CmapusNavigation
//
//  Created by Xitao Lv on 3/5/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<GoogleMaps/GoogleMaps.h>
#import "MDDirectionService.h"
#import "CustomInfowindow.h"
//set up the viewcontroller to GMSMapViewDelegate and CLLocationManagerDelegate
//in order to implement Google Maps SDK
@interface GoogleViewController : UIViewController<GMSMapViewDelegate,CLLocationManagerDelegate>
@property (strong, nonatomic) NSNumber *numberLa;
@property (strong, nonatomic) NSNumber *numberLong;
@property (strong, nonatomic) NSString *titleString;
@property (strong, nonatomic) NSString *addressString;

@end
