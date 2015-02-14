//
//  MapViewController.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 1/25/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "MapViewController.h"
#import "SearchTableViewController.h"
#import "GViewController.h"
@interface MapViewController ()

@end

@implementation MapViewController
@synthesize west;
@synthesize east;
@synthesize south;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"west"]) {
        WestViewController *west = [segue destinationViewController];
        //[self performSegueWithIdentifier:@"start" sender:self];
    }

    
}

//initialize view controller with the background image and the button image

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"Explore";
    
    //initialize navigationbar item button
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"newDirection.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnDirection)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 24, 24)];
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(btnSearch)];
    UIBarButtonItem *directionItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    NSArray *actionButtonItems = @[searchItem, directionItem];
    self.navigationItem.rightBarButtonItems = actionButtonItems;
  
}

//navigationbar item button

- (void)btnSearch
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    SearchTableViewController* searchview = [storyboard instantiateViewControllerWithIdentifier:@"search"];
    
    [self.navigationController pushViewController:searchview animated:YES];
}
//navigationbar item button
- (void)btnDirection
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    GViewController *directionview = [storyboard instantiateViewControllerWithIdentifier:@"direction"];
    
    [self.navigationController pushViewController:directionview animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
