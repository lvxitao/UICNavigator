//
//  WestViewController.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 3/28/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "WestViewController.h"
#import "LibraryAPI.h"
#import "Infomation.h"

// A Viewcontroller for west campus maps view

@interface WestViewController ()
{
    GMSMapView *mapView_;
    NSArray *allIinfo;
    //Infomation * info;
    int placeflag;
}

@end

@implementation WestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// sep up maps view for west campus
// set up cameraPosition of maps view
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:41.870099
                                                            longitude: -87.672491
                                                                 zoom:16];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.view = mapView_;
    
    allIinfo = [[LibraryAPI sharedInstance]getInfo];
    
    //load place infomation
    for (Infomation *info in allIinfo) {
        double la;
        double longt;
        la = [info.latitude doubleValue];
        longt = [info.longtitude doubleValue];
        GMSMarker *marker =[[GMSMarker alloc] init];
        mapView_.delegate = self;
        marker.position =CLLocationCoordinate2DMake(la, longt);
        marker.title = info.name;
        marker.snippet = info.address;
        marker.accessibilityLabel = info.imagePath;
        marker.opacity = 0.6;
        marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
        marker.map =mapView_;
        //NSLog(@"@%",marker.accessibilityLabel);
        //NSLog(@"@%",info.imagePath);
    }
}

// set up popup info window
//customize infowindow
- (UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker {
    //NSLog(@"infowindow");
    CustomInfowindow *view =  [[[NSBundle mainBundle] loadNibNamed:@"Infowindows" owner:self options:nil] objectAtIndex:0];
    view.name.text = marker.title;
    view.address.text = marker.snippet;
    
    
    return view;
}

// go to destination viewcontroller when tapping on infowindow
-(void) mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    DestinationViewController* desview = [storyboard instantiateViewControllerWithIdentifier:@"placeDetail"];
    [desview setTitleString:marker.title];
    [desview setAddressString:marker.snippet];
    [desview setImageString:marker.accessibilityLabel];
    [desview setNumberLa:[NSNumber numberWithDouble: marker.position.latitude]];
    [desview setNumberLong:[NSNumber numberWithDouble:marker.position.longitude]];
    [desview setCampusString:@"West"];
    [self.navigationController pushViewController:desview animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
