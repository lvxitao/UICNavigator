//
//  SearchTableViewController.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 1/31/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "SearchTableViewController.h"
#import "Place.h"
#import "DestinationViewController.h"
#import "InfoManager.h"
#import "LibraryAPI.h"
#import "MapViewController.h"
#import "GViewController.h"

@interface SearchTableViewController ()
{
    //NSString to store all the information of place
    
    NSString *placeName;
}

@end

@implementation SearchTableViewController

//synthesize all properties
@synthesize  placeArray;
@synthesize filteredPlaceArray;
@synthesize placeSearchBar;

//initialize listed table view
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

//delegate tableview in order to use APIs of search bar
//initialize placeArray to store infomation of all buildings
//load place array to content of table view/search display controller
//set filter
//set shortcuts to go to explore view and direction view
//set placeArray

- (void)viewDidLoad
{
    
    
    //initialize 
    
    [super viewDidLoad];
    self.tableView.dataSource =self;
    self.tableView.delegate = self;
    // Hide the search bar until user scrolls up
   
    //initialize placeArray with infomation of all buildings
   
    placeArray =[[LibraryAPI sharedInstance]getInfo];
    self.filteredPlaceArray = [NSMutableArray arrayWithCapacity:[placeArray count]];
    // Reload the table
    [self.tableView reloadData];
    [self.tableView setTableHeaderView: placeSearchBar];
    //[self.tableView setTableHeaderView: nil];
    [self.view.superview addSubview: placeSearchBar];
    //[self.navigationController.view addSubview: self.tableView];
    [placeSearchBar setFrame:CGRectMake(0, 0, 320, 44)];
    
    
    //initialize navigation/shotcuts button item
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"find.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnExplore)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 24, 24)];
    UIBarButtonItem *exoloreItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    UIButton *button2 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setImage:[UIImage imageNamed:@"newDirection.png"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(btnDirection)forControlEvents:UIControlEventTouchUpInside];
    [button2 setFrame:CGRectMake(0, 0, 24, 24)];
    UIBarButtonItem *directionItem = [[UIBarButtonItem alloc]initWithCustomView:button2];
    
    NSArray *actionButtonItems = @[directionItem, exoloreItem];
    self.navigationItem.rightBarButtonItems = actionButtonItems;
    

 
}

//shortcuts buton method
//link current page view to explore view

- (void) btnExplore
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    MapViewController* exploreview = [storyboard instantiateViewControllerWithIdentifier:@"explore"];
    
    [self.navigationController pushViewController:exploreview animated:YES];
}

-(void) btnDirection
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    GViewController* directionview = [storyboard instantiateViewControllerWithIdentifier:@"direction"];
    
    [self.navigationController pushViewController:directionview animated:YES];
}


//set filter to search text and search scope
// Filter the array using NSPredicate

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
	// Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
	[self.filteredPlaceArray removeAllObjects];
	
    //NSMutableArray *parr = [NSMutableArray array];
    //[parr addObject:[NSPredicate predicateWithFormat:@"SELF.departmentTag contains[c] %@",searchText]];
    //[parr addObject:[NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText]];
    //NSPredicate *compoundpred = [NSCompoundPredicate andPredicateWithSubpredicates:parr];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
   // NSArray *tempArray = [placeArray filteredArrayUsingPredicate:predicate];
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"SELF.departmentTag contains[c] %@",searchText];
    //NSArray *tempArray2 = [placeArray filteredArrayUsingPredicate:predicate2];
    NSPredicate *compoundPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[predicate, predicate2]];
    NSArray *tempArray = [placeArray filteredArrayUsingPredicate:compoundPredicate];
    if (![scope isEqualToString:@"All"]) {
        // Further filter the array with the scope
        NSPredicate *scopePredicate = [NSPredicate predicateWithFormat:@"SELF.tag contains[c] %@",scope];
        tempArray = [tempArray filteredArrayUsingPredicate:scopePredicate];
    }
    filteredPlaceArray = [NSMutableArray arrayWithArray:tempArray];
}

//setup search display controller
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

//setup search display controller
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

//setup searchbar in search display controller
-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.searchDisplayController setActive:NO animated:YES];
    //NSLog(@"canel button");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//connect table view with filter array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    //return [placeArray count];
    // Check to see whether the normal table or search results table is being displayed and return the count from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [filteredPlaceArray count];
    } else {
        return [placeArray count];
    }
}

// set up table view with names of buildings and tags of the buildings
// dynamiclly set the height of each cell of the table view

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    //Change this value to adjust size
    cell.textLabel.font = [UIFont systemFontOfSize:11];
    cell.textLabel.textColor = [UIColor blackColor];
    //Change this value to show more or less lines.
    cell.textLabel.numberOfLines = 1;
    cell.textLabel.textAlignment =NSTextAlignmentLeft;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:8];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    //cell.detailTextLabel.textAlignment= NSTextAlignmentLeft;
    //cell.textLabel.text = @"This is my text";
    // Create a new place Object
    //Place *place = nil;
    Infomation *info =nil;
    //place = [placeArray objectAtIndex:indexPath.row];
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        info = [filteredPlaceArray objectAtIndex:indexPath.row];
    } else {
        info = [placeArray objectAtIndex:indexPath.row];
    }
    
    // Configure the cell
    cell.textLabel.text = info.name;
    cell.detailTextLabel.text = info.departmentTag;
    cell.detailTextLabel.numberOfLines = 5;
    cell.detailTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
    placeName = cell.textLabel.text;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    return cell;
}


//get infomation from the cell user touched

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Perform segue to place detail
    [self performSegueWithIdentifier:@"destination" sender:tableView];
}

// pass data to next view controller
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"destination"]) {
        
        
        UIViewController *placeDetailViewController = [segue destinationViewController];
        // In order to manipulate the destination view controller, another check on which table (search or normal) is displayed is needed
        if(sender == self.searchDisplayController.searchResultsTableView) {
            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            NSString *destinationTitle = [[filteredPlaceArray objectAtIndex:[indexPath row]] name];
            [placeDetailViewController setTitle:destinationTitle];
            //placeDetailViewController.locationstring= @"hello";
            NSString *title =destinationTitle;
            Infomation *resultinfo;
            for (Infomation *info in placeArray) {
                if([info.name isEqualToString:title])
                    resultinfo = info;
            }
            [[segue destinationViewController] setTitleString:resultinfo.name];
            [[segue destinationViewController] setAddressString:resultinfo.address];
            [[segue destinationViewController] setImageString:resultinfo.imagePath];
            [[segue destinationViewController] setNumberLa:resultinfo.latitude];
            [[segue destinationViewController] setNumberLong:resultinfo.longtitude];
            if([resultinfo.tag isEqualToString:@"West"])
            {
                [[segue destinationViewController]setCampusString:@"West" ];
            }
            
            NSLog(@"1");
            
            
        }
        else {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            NSString *destinationTitle = [[placeArray objectAtIndex:[indexPath row]] name];
            [placeDetailViewController setTitle:destinationTitle];
            //[[segue destinationViewController] setTitleString:[[placeArray objectAtIndex:[indexPath row]] name]];
            NSString *title =destinationTitle;
            Infomation *resultinfo;
            for (Infomation *info in placeArray) {
                if([info.name isEqualToString:title])
                    resultinfo = info;
            }
            [[segue destinationViewController] setTitleString:resultinfo.name];
            [[segue destinationViewController] setAddressString:resultinfo.address];
            [[segue destinationViewController] setImageString:resultinfo.imagePath];
            [[segue destinationViewController] setNumberLa:resultinfo.latitude];
            [[segue destinationViewController] setNumberLong:resultinfo.longtitude];

            NSLog(@"2");
        }
        
    }
}

//dynamiclly change tableview item height

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView
                      cellForRowAtIndexPath:indexPath];
    NSString *str =cell.detailTextLabel.text;
    CGRect textRect = [str boundingRectWithSize:CGSizeMake(310, 9999)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]}
                                         context:nil];
    
    CGSize size = textRect.size;
    
    return size.height+25;
}
- (CGFloat)textViewHeightForAttributedText: (NSAttributedString*)text andWidth: (CGFloat)width {
    UITextView *calculationView = [[UITextView alloc] init];
    [calculationView setAttributedText:text];
    CGSize size = [calculationView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}
//active the search bar
-(IBAction)goToSearch:(id)sender {
    // If you're worried that your users might not catch on to the fact that a search bar is available if they scroll to reveal it, a search icon will help them
    // If you don't hide your search bar in your app, don’t include this, as it would be redundant
    //[self.tableView setContentOffset:CGPointMake(0, 0) animated:NO];
    [placeSearchBar becomeFirstResponder];
    [placeSearchBar setShowsCancelButton:YES animated:YES];
    [self.view endEditing:YES];
}



@end
