//
//  NewViewController.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 2/8/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "NewViewController.h"
#import "ChildViewController.h"

// a viewcontroller to test shareapplication in subview
@interface NewViewController ()

@end

@implementation NewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    ChildViewController *mapController = [self.storyboard instantiateViewControllerWithIdentifier:@"ChildViewController"];
   
    [self.navigationController popViewControllerAnimated:NO];
    mapController.view.frame = self.childView.bounds;
    [mapController willMoveToParentViewController:self];
    [self.childView addSubview:mapController.view];
    [self addChildViewController:mapController];
    [mapController didMoveToParentViewController:self];
    
    
    
    /*AFHTTPClient *_httpClient = [AFHTTPClient clientWithBaseURL:[NSURL
                                                                 URLWithString:@"http://maps.googleapis.com/"]];
    [_httpClient registerHTTPOperationClass: [AFJSONRequestOperation class]];
    CLLocation *location1 = [[CLLocation alloc]initWithLatitude:41.873747 longitude:-87.652831];
    CLLocation *location2=[[CLLocation alloc]initWithLatitude:41.870828 longitude:-87.674525];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location1.coordinate, 500, 500);
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:viewRegion];
    [mapView setRegion:adjustedRegion animated:NO];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:[NSString stringWithFormat:@"%f,%f",location1.coordinate.latitude,location1.coordinate.longitude] forKey:@"origin"];
    [parameters setObject:[NSString stringWithFormat:@"%f,%f",location2.coordinate.latitude,location2.coordinate.longitude] forKey:@"destination"];
    [parameters setObject:@"true" forKey:@"sensor"];
    [parameters setObject:@"driving" forKey:@"mode"];
    [parameters setObject:@"metric" forKey:@"units"];
    NSMutableURLRequest *request = [_httpClient requestWithMethod:@"GET" path:
                                    @"maps/api/directions/json" parameters:parameters];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    AFHTTPRequestOperation *operation = [_httpClient
                                         HTTPRequestOperationWithRequest:request
                                         success:^(AFHTTPRequestOperation *operation, id response) {
                                             NSInteger statusCode = operation.response.statusCode;
                                             if (statusCode == 200) {
                                                 //[self parseResponse:response];
                                             } else {
                                             }
                                         } failure:^(AFHTTPRequestOperation *operation, NSError *error) { }];
    [_httpClient enqueueHTTPRequestOperation:operation];
    */
    
   /* CLLocationCoordinate2D coordinate =CLLocationCoordinate2DMake(41.873747,-87.652831);
    
    MKPlacemark *placemark= [[MKPlacemark alloc]initWithCoordinate:coordinate addressDictionary:nil];
    MKMapItem *mapItem = [[MKMapItem alloc]initWithPlacemark:placemark];
    
    [mapItem openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving}];*/
   
   
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
