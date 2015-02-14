//
//  EastViewController.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 4/12/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

// A Viewcontroller for west campus maps view
#import "EastViewController.h"
#import "LibraryAPI.h"
#import "Infomation.h"

@interface EastViewController ()
{
    GMSMapView *mapView_;
    NSArray *allIinfo;
    //Infomation * info;
    int placeflag;
}

@end

@implementation EastViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// sep up maps view for east campus
// set up camera Position of maps view
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:41.871894
                                                            longitude: -87.649269
                                                                 zoom:16];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.view = mapView_;
    
    //load place infomation
    allIinfo = [[LibraryAPI sharedInstance]getInfo];
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

//customize info window
- (UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker {
    //NSLog(@"infowindow");
    CustomInfowindow *view =  [[[NSBundle mainBundle] loadNibNamed:@"Infowindows" owner:self options:nil] objectAtIndex:0];
    view.name.text = marker.title;
    view.address.text = marker.snippet;
    

    return view;
}

//go to destination viewcontroller when tapping on the infowindow
-(void) mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    DestinationViewController* desview = [storyboard instantiateViewControllerWithIdentifier:@"placeDetail"];
    [desview setTitleString:marker.title];
    [desview setAddressString:marker.snippet];
    [desview setImageString:marker.accessibilityLabel];
    [desview setNumberLa:[NSNumber numberWithDouble: marker.position.latitude]];
    [desview setNumberLong:[NSNumber numberWithDouble:marker.position.longitude]];
    [self.navigationController pushViewController:desview animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
