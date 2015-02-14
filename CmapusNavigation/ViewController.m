//
//  ViewController.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 1/22/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "ViewController.h"
#import "LibraryAPI.h"
#import "Infomation.h"
@interface ViewController ()
{
    //places infomation
    NSArray *allInfo;
    
    Infomation *info;
}

@end

@implementation ViewController

//link current page view to next page view

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"search"]) {
        SearchTableViewController *searchTable = [segue destinationViewController];
        //[self performSegueWithIdentifier:@"start" sender:self];
    }
    else if([segue.identifier isEqualToString:@"map"]){
        MapViewController *mapView = [segue destinationViewController];
    }

}

//viewDidLoad set the background color, opaque and title of the navigation bar
- (void)viewDidLoad
{
    [super viewDidLoad];
    //set blured view
    self.backgroundColorView.barStyle = UIBarStyleBlack; // this will give a black blur as in the original post
    self.backgroundColorView.opaque = NO;
    self.backgroundColorView.alpha = 0.5;
    self.backgroundColorView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1];
  
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.title = @"UIC CampusNav";
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
