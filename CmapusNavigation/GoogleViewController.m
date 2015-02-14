//
//  GoogleViewController.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 3/5/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "GoogleViewController.h"
#import<GoogleMaps/GoogleMaps.h>

// A class to implement google map view for directions
// request route wayporints data though google maps API via MDDirectionServiece class
// infomation data were passed by previous controller
// curret location might not be loaded under ios stimulator but ok for iOS device test

@interface GoogleViewController ()
{
    //google map view
    GMSMapView *mapView_;
    BOOL firstLocationUpdate_;
    //way points from google maps api via MDDirectionServiece class
    NSMutableArray *waypoints_;
    NSMutableArray *waypointStrings_;
    double dlatitude;
    double dlongtitude;
    //CLLocationManager *locationManager;
}

@end

@implementation GoogleViewController
{
    //GMSPolyline to draw lines on maps view
    GMSPolyline * myline;
    
    //llocation manager to get current locaiton
    CLLocationManager *locationManager;
}
@synthesize numberLa;
@synthesize numberLong;
@synthesize titleString;
@synthesize addressString;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//set up maps view with current location and current camera view
//get destination point with data from previous viewcontroller
//set destination icons
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // Create a GMSCameraPosition that tells the map to display the
    
    myline =[[GMSPolyline alloc] init];
    myline.strokeColor = [UIColor blueColor];
    locationManager = [[CLLocationManager alloc] init];
    waypoints_ = [[NSMutableArray alloc]init];
    waypointStrings_ = [[NSMutableArray alloc]init];
    
    locationManager.delegate = self;
    
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    self->mapView_.myLocationEnabled = YES;
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];
    
    self.view = mapView_;
   
    NSLog(@"testting %@|,%@|,%@|,%@|", numberLa, numberLong, titleString, addressString);
    
    dlatitude = [numberLa doubleValue];
    dlongtitude = [numberLong doubleValue];

   
   
    // initial place view
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:dlatitude
                                                            longitude:dlongtitude
                                                                 zoom:15];
   
    NSLog(@"current location %f, %f",locationManager.location.coordinate.latitude,locationManager.location.coordinate.longitude );
    
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.settings.compassButton = YES;
    mapView_.settings.myLocationButton = YES;
    
  
    
    self.view = mapView_;
    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(
                                                                 dlatitude,
                                                                 dlongtitude);
    GMSMarker *marker = [GMSMarker markerWithPosition:position];
    marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
    marker.opacity = 0.6;
    marker.title =titleString;
    marker.snippet = addressString;
    marker.map = mapView_;
    
    
    // Ask for My Location data after the map has already been added to the UI.
    dispatch_async(dispatch_get_main_queue(), ^{
        mapView_.myLocationEnabled = YES;
    });

    

}

//popUp when no network connecting
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

// use observer to update route crash apple device

/*- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
  
        [mapView_ clear];
    
        
        CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];
    
        GMSMutablePath *path = [GMSMutablePath path];
        [path addLatitude:location.coordinate.latitude longitude:location.coordinate.longitude]; // current
        
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake(
                                                                     dlatitude,
                                                                     dlongtitude);
        GMSMarker *marker = [GMSMarker markerWithPosition:position];
    
        marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
        marker.opacity = 0.6;
        marker.title =titleString;
        marker.snippet = addressString;
        marker.map = mapView_;
        
        CLLocationCoordinate2D position2 = CLLocationCoordinate2DMake(
                                                                      location.coordinate.latitude,
                                                                      location.coordinate.longitude);
        
        GMSMarker *marker2 = [GMSMarker markerWithPosition:position2];
        
    
        waypoints_ = [[NSMutableArray alloc]init];
        waypointStrings_ = [[NSMutableArray alloc]init];
        [waypoints_ addObject:marker];
        [waypoints_ addObject:marker2];
        //NSLog(@"test for marker %@ %@", marker, marker2);
        //NSLog(@"test for waypoints_ %@", waypoints_);
        
        NSString *positionString = [[NSString alloc] initWithFormat:@"%f,%f",
                                    dlatitude,dlongtitude];
        NSString *positionString2 = [[NSString alloc] initWithFormat:@"%f,%f",
                                    location.coordinate.latitude,location.coordinate.longitude];
        [waypointStrings_ addObject:positionString];
        [waypointStrings_ addObject:positionString2];
        if([waypoints_ count]>1){
        
            NSString *sensor = @"false";
            NSArray *parameters = [NSArray arrayWithObjects:sensor, waypointStrings_,
                                   nil];
            NSArray *keys = [NSArray arrayWithObjects:@"sensor", @"waypoints", nil];
            NSDictionary *query = [NSDictionary dictionaryWithObjects:parameters
                                                              forKeys:keys];
            MDDirectionService *mds=[[MDDirectionService alloc] init];
            SEL selector = @selector(addDirections:);
            [mds setDirectionsQuery:query
                       withSelector:selector
                       withDelegate:self];
        }
        else{
            NSLog(@"waypoints%@",waypoints_);
        }
    
        
    
}*/


// draw polyline from current location to the destination icon
- (void)addDirections:(NSDictionary *)json {
    NSDictionary *routes = [json objectForKey:@"routes"][0];
    NSDictionary *route = [routes objectForKey:@"overview_polyline"];
    NSString *overview_route = [route objectForKey:@"points"];
    GMSPath *path = [GMSPath pathFromEncodedPath:overview_route];
    //GMSPolyline *polyline =[GMSPolyline polylineWithPath:path];
    myline = [GMSPolyline polylineWithPath:path];
    myline.strokeWidth = 3.0f;
    //myline.geodesic =YES;
    //myline.strokeColor = [UIColor blueColor];
    myline.strokeColor = [UIColor colorWithRed:0.0/255.0 green:123.0/255.0 blue:255.0/255/0 alpha:1.0];
    myline.map =mapView_;
    
    //myline.spans = @[[GMSStyleSpan spanWithColor:[UIColor redColor]]];
    
    //polyline.map = nil;
}


// update the polyline with cllocationManager
// when current location change, redraw the polyline from current location to the destination
// the App will crush if the method update polyline too frequent
// so the method add limits to reduce the update times of polyline

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    //[mapView_ clear];
    
   /* CLLocationCoordinate2D position = CLLocationCoordinate2DMake(
                                                                 dlatitude,
                                                                 dlongtitude);*/
    /*GMSMarker *marker = [GMSMarker markerWithPosition:position];
    marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
    marker.opacity = 0.6;
    marker.title =titleString;
    marker.snippet = addressString;
    marker.map = mapView_;*/
    if(oldLocation.coordinate.latitude !=newLocation.coordinate.latitude||oldLocation.coordinate.longitude != oldLocation.coordinate.longitude)
    {
        myline.map = nil;
        //print current location to test the update method
        
        NSString *pointString2=[NSString stringWithFormat:@"%f,%f",newLocation.coordinate.latitude,newLocation.coordinate.longitude];
        NSString *pointString =[NSString stringWithFormat:@"%f,%f",dlatitude,dlongtitude];
        [self->waypoints_ addObject:pointString];
        [self->waypoints_ addObject:pointString2];
        // NSLog(@"update location %f %f",newLocation.coordinate.latitude, newLocation.coordinate.longitude);
        
        //NSLog(@"test for marker %@ %@", marker, marker2);
        //NSLog(@"test for waypoints_ %@", waypoints_);
        
        NSString *positionString = [[NSString alloc] initWithFormat:@"%f,%f",
                                    dlatitude,dlongtitude];
        NSString *positionString2 = [[NSString alloc] initWithFormat:@"%f,%f",
                                     newLocation.coordinate.latitude,newLocation.coordinate.longitude];
        
        //get waypoints from google maps API
        [waypointStrings_ addObject:positionString];
        [waypointStrings_ addObject:positionString2];
        if([waypoints_ count]>1){
            
            NSString *sensor = @"false";
            NSArray *parameters = [NSArray arrayWithObjects:sensor, waypointStrings_,
                                   nil];
            NSArray *keys = [NSArray arrayWithObjects:@"sensor", @"waypoints", nil];
            NSDictionary *query = [NSDictionary dictionaryWithObjects:parameters
                                                              forKeys:keys];
            MDDirectionService *mds=[[MDDirectionService alloc] init];
            SEL selector = @selector(addDirections:);
            [mds setDirectionsQuery:query
                       withSelector:selector
                       withDelegate:self];
            [waypoints_ removeAllObjects];
            [waypointStrings_ removeAllObjects];
        }
        else{
            //NSLog(@"waypoints%@",waypoints_);
        }
        
    
    
    }

   
}

- (void) moveCameraToPosition:(CLLocationCoordinate2D) position
{
    
    GMSCameraUpdate *camera = [GMSCameraUpdate setTarget:position];
    [mapView_ animateWithCameraUpdate:camera];
    
    
}

/*- (UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker {
    NSLog(@"infowindow");
    CustomInfowindow *view =  [[[NSBundle mainBundle] loadNibNamed:@"Infowindows" owner:self options:nil] objectAtIndex:0];
    if ([marker.title  isEqual: @"UIC Medical Center"]) {
        view.name.text = @"UIC Medical Center";
        view.address.text = @"Place description";
        //view.image.image = [UIImage imageNamed:@"Biologic Resources Laboratory.jpg"];
    }
    else if([marker.title  isEqual: @"Easter Seal Bldg"]){
        view.name.text = @"Easter Seal Bldg";
        view.address.text = @"west";
    }
    else if([marker.title  isEqual: @"Lot W3"]){
        view.name.text = @"Lot W3";
        view.address.text = @"2212 W Polk St";
        //view.image.image =[UIImage imageNamed:@"Lot W3.png"];
    }
    return 0;
}*/

//update infowindow
- (UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker {
    NSLog(@"infowindow");
    CustomInfowindow *view =  [[[NSBundle mainBundle] loadNibNamed:@"Infowindows" owner:self options:nil] objectAtIndex:0];
    view.name.text = marker.title;
    view.address.text = marker.snippet;
    return view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
