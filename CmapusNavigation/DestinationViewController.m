//
//  DestinationViewController.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 1/31/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "DestinationViewController.h"

// A viewcontroller contains all the infomation of the destiantion includding the name,
// the adress and the picture
// and a direction button to invoke Popup window
@interface DestinationViewController ()
{
    NSString *placeID;
    // longtitude and latitude
    double dlatitude;
    double dlongtitude;
}

@end

@implementation DestinationViewController
//infomation of the place
@synthesize BuildingView;
@synthesize logo;
@synthesize destination;
@synthesize address;
@synthesize campus;
@synthesize numberLa;
@synthesize numberLong;
@synthesize titleString;
@synthesize addressString;
@synthesize imageString;

//popUpview
@synthesize popUp;
//campus flag
@synthesize campusString;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//pass the infomation of the destinaiton to next viewcontroller

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    //pass data to RouteViewcontroller
    if ([segue.identifier isEqualToString:@"start"]) {
        [popUp setHidden:YES];
        RouteViewController *routeView = [segue destinationViewController];
        [[segue destinationViewController] setNumberLa:numberLa];
        [[segue destinationViewController] setNumberLong:numberLong];
        [[segue destinationViewController] setName:titleString];
        [[segue destinationViewController] setAddress:addressString];
        
        
        //[self performSegueWithIdentifier:@"start" sender:self];
    }
    
    //pass data to GoogleViewController
    if ([[segue identifier] isEqualToString:@"google"]) {
        [popUp setHidden:YES];
        GoogleViewController *googleView = [segue destinationViewController];
    
        [[segue destinationViewController] setNumberLa:numberLa];
        [[segue destinationViewController] setNumberLong:numberLong];
        [[segue destinationViewController] setTitleString:titleString];
        [[segue destinationViewController] setAddressString:addressString];
        
        
    }
   /* if ([segue.identifier isEqualToString:@"nav"]){
        NewViewController *newView = [segue destinationViewController];
    }*/
    /*if ([segue.identifier isEqualToString:@"go"]){
        NewViewController *newView = [segue destinationViewController];
    }*/
 
}

// set up the destinationviewcontriller with the picture,
// the adress,logo picture, and latitude and longtitude

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    // set label
    [BuildingView setImage:[UIImage imageNamed:imageString]];
    [logo setImage:[UIImage imageNamed:@"icon.png"]];
    self.destination.text = self.titleString;
    [address setText:self.addressString];
    [address setTextColor:[UIColor darkGrayColor]];
    if (![campusString isEqualToString:nil]) {
        campus.text = @"Chicago, IL 60612";
    }
    
    //dismiss Popu up when users touch other parts
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPopup)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.delegate = self;
    [self.view addGestureRecognizer:tapRecognizer];
    dlatitude = [numberLa floatValue];
    dlongtitude = [numberLong floatValue];
    NSLog(@"%@,%@",numberLa,numberLong);
    
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// invoke popUp
- (IBAction)direction:(id)sender {
    [popUp setHidden: NO];
}

- (IBAction)Pclose:(id)sender {
    [popUp setHidden:YES];
}

// open google map APP with parameters and X-call back
// the parameters are latitude and longtitude

- (IBAction)GmapOpen:(id)sender {
    [popUp setHidden:YES];
    NSURL *testURL = [NSURL URLWithString:@"comgooglemaps-x-callback://"];
    if ([[UIApplication sharedApplication] canOpenURL:testURL]) {
        
        NSString *directionRequest = [NSString stringWithFormat:@"%@%f%@%f%@",@"comgooglemaps-x-callback://?daddr=",dlatitude,@"+",dlongtitude,@"&x-success=UICCampusNav://?resume=true&x-source=UIC+Campus+Navigation&directionsmode=walking"];
        NSURL *directionsURL = [NSURL URLWithString:directionRequest];
        [[UIApplication sharedApplication] openURL:directionsURL];
    } else {
        NSLog(@"Can't use comgooglemaps-x-callback:// on this device.");
    }

    
}
// dismiss pop up 
- (void)dismissPopup {
    [popUp setHidden:YES];

}

// prevent dismissing from touching popup itself
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return touch.view == self.view;
}
@end
