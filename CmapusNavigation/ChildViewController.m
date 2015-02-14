//
//  ChildViewController.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 2/26/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "ChildViewController.h"
// a class to test implementing a subview of a viewcontroller
@interface ChildViewController ()

@end

@implementation ChildViewController

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
    //[self.navigationController popViewControllerAnimated:NO];
	// Do any additional setup after loading the view.
   /* CLLocationCoordinate2D coordinate =CLLocationCoordinate2DMake(41.873747,-87.652831);
    //create placemark out of these coordinates
    MKPlacemark *placemark= [[MKPlacemark alloc]initWithCoordinate:coordinate addressDictionary:nil];
    MKMapItem *mapItem = [[MKMapItem alloc]initWithPlacemark:placemark];
    mapItem.name = @"Grant Hall";
    mapItem.phoneNumber = @"+12127363100";
    mapItem.url = [NSURL URLWithString:@"www.uic.com"];
    
    [mapItem openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving}];*/
    // Create string for the place ...
    /*NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"comgooglemaps://?center=%f,%f",41.873747,-87.652831]];
   [[UIApplication sharedApplication] openURL:url];*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
