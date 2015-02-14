//
//  SearchBarViewController.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 1/23/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "SearchBarViewController.h"

//test controller for SearchTableViewController

@interface SearchBarViewController ()
{
    NSMutableArray *totalString;
    NSMutableArray *filterString;
    BOOL isfiltered;
}

@end

@implementation SearchBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//set cells for search table view
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.mySearchBar.delegate = self;
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    //[self.navigationController setNavigationBarHidden:YES];
    //[self.navigationController popToRootViewControllerAnimated:YES];
    totalString = [[NSMutableArray alloc]initWithObjects:@"one",@"Two",@"Three",@"Four",@"Five",@"Six",@"Seven", nil];
}

// set filter for searching
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length==0) {
        isfiltered =NO;
        //flag=0;
    }
    else
    {
        isfiltered = YES;
        //flag=1;
        filterString=[[NSMutableArray alloc]init];
        
        for (NSString *str in totalString) {
            NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if(stringRange.location!=NSNotFound)
            {
                [filterString addObject:str];
            }
        }
    }
    [self.myTableView reloadData];
    
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.mySearchBar resignFirstResponder];
    searchBar.searchResultsButtonSelected=YES;
    //flag=1;
}

// initialize table view
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isfiltered) {
        return [filterString count];
    }
    return [totalString count];
}

//implement search method

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    if(!isfiltered)
    {
        cell.textLabel.text = [totalString objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [filterString objectAtIndex:indexPath.row];
    }
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
