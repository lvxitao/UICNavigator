//
//  GViewController.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 4/13/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "GViewController.h"
#import "SWRevealViewController.h"
#import "MapViewController.h"
#import "SearchTableViewController.h"

// A class to get directions with name of start point and the desitnations
// the class will open and pass data to google maps Application in order to finish getting directions
// x call back will be called in order to go back to UIC Navigator
// Data for directions were passed by destination viewcontroller

@interface GViewController ()

@end

@implementation GViewController
@synthesize startText;
@synthesize endText;
@synthesize searchBarButtonItem;
@synthesize exploreButtonItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// set up the background, button and shortcuts for direction viewcontroller
- (void)viewDidLoad
{
    [super viewDidLoad];
    //initialize text field and navgation bar title
    self.startText.delegate = self;
    self.endText.delegate = self;
    self.navigationItem.title = @"Get Direction";
    
    //initialize navigation bar button item
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"find.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnExplore)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 24, 24)];
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(btnSearch)];
    UIBarButtonItem *exoloreItem = [[UIBarButtonItem alloc]initWithCustomView:button];

    NSArray *actionButtonItems = @[searchItem, exoloreItem];
    self.navigationItem.rightBarButtonItems = actionButtonItems;


}

// navigation bar/shortcuts button action
- (void) btnExplore
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    MapViewController* exploreview = [storyboard instantiateViewControllerWithIdentifier:@"explore"];

    [self.navigationController pushViewController:exploreview animated:YES];

}

// navigation bar/shortcuts button action
- (void) btnSearch
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    SearchTableViewController* searchview = [storyboard instantiateViewControllerWithIdentifier:@"search"];
    
    [self.navigationController pushViewController:searchview animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    searchBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editAction)];
    
    exploreButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAction)];
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:searchBarButtonItem, exploreButtonItem, nil];
    
    
    // Dispose of any resources that can be recreated.
}
-(void)editAction
{
    NSLog(@"edit button clicked");
}

-(void)saveAction
{
    NSLog(@"save button clicked");
}


//add google maps x-call back URL scheme function
//the function will add a black strip button on the top of screen
//in order to let users go back to UIC Navigator


- (IBAction)Direction:(UIButton *)sender {
    
    NSString *start = startText.text;
    NSString *end = endText.text;
    NSLog(@"Direction");
    start= [start stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    end =[end stringByReplacingOccurrencesOfString:@" " withString:@"+"];
   // NSString* url = [NSString stringWithFormat:@"%@%@%@%@", @"http://maps.google.com/maps?saddr=",start,@"&daddr=",end];
    
    //[[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];
   /* if ([[UIApplication sharedApplication] canOpenURL:
         [NSURL URLWithString:@"comgooglemaps://"]]) {
        [[UIApplication sharedApplication] openURL:
         [NSURL URLWithString:@"comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic"]];
    } else {
        NSLog(@"Can't use comgooglemaps://");
    }*/
    NSURL *testURL = [NSURL URLWithString:@"comgooglemaps-x-callback://"];
    if ([[UIApplication sharedApplication] canOpenURL:testURL]) {
        
        NSString *directionRequest = [NSString stringWithFormat:@"%@%@%@%@%@",@"comgooglemaps-x-callback://?sddr=",start,@"&daddr=",end,@"&x-success=UICCampusNav://?resume=true&x-source=UIC+Campus+Navigation"];
        //NSLog(@"%@",directionRequest);
        NSURL *directionsURL = [NSURL URLWithString:directionRequest];
        [[UIApplication sharedApplication] openURL:directionsURL];
    } else {
        NSLog(@"Can't use comgooglemaps-x-callback:// on this device.");
    }
    
}

//make return button avialable for keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    //[textField setHidden:YES];
    
    return YES;
}
@end
