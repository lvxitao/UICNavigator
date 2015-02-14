//
//  SearchBarViewController.h
//  CmapusNavigation
//
//  Created by Xitao Lv on 1/23/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <UIKit/UIKit.h>
// The viewcontroller should be delegated with UISearchBarDelegate, UISearchDisplayDelegate
// in order to implement Search bar and listed table view.

//test controller
@interface SearchBarViewController : UIViewController<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
