//
//  SearchTableViewController.h
//  CmapusNavigation
//
//  Created by Xitao Lv on 1/31/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <UIKit/UIKit.h>
// The viewcontroller should be delegated with UISearchBarDelegate, UISearchDisplayDelegate
// in order to implement Search bar and listed table view.
@interface SearchTableViewController : UITableViewController<UISearchBarDelegate, UISearchDisplayDelegate>

// an Array to store infomation of all buildings
@property (strong, nonatomic) NSArray *placeArray;

// an Array to store string in order to filter search results
@property (strong, nonatomic) NSMutableArray *filteredPlaceArray;

// search function
-(IBAction)goToSearch:(id)sender;

// search bar property 
@property (weak, nonatomic) IBOutlet UISearchBar *placeSearchBar;


@end
