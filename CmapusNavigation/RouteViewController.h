//
//  RouteViewController.h
//  CmapusNavigation
//
//  Created by Xitao Lv on 2/1/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#define kGOOGLE_API_KEY @"API Google Key here"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

//set viwcontroller to MKMapViewDelegate and CllocationManagerDelegate in order to implement Apple Mapkit framework

@interface RouteViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocationCoordinate2D currentCentre;
    
    
    int currenDist;
    BOOL firstLaunch;
}
//property of mapview
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) MKPolyline *routeLine;
@property (nonatomic, retain) MKPolylineView *routeLineView;
@property (strong, nonatomic) MKRouteStep *routeStep;

//properties to store infomation from previous ViewControllers
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSNumber *numberLa;
@property (strong, nonatomic) NSNumber *numberLong;
@end
