//
//  ViewController.h
//  CmapusNavigation
//
//  Created by Xitao Lv on 1/22/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchTableViewController.h"
#import "MapViewController.h"
#import "GoogleViewController.h"
#import "NewViewController.h"
#import "Infomation.h"

@interface ViewController : UIViewController
{
    __weak IBOutlet UIButton *SearchButton;

    __weak IBOutlet UIButton *MapButton;
    
    __weak IBOutlet UIButton *CategoryButton;
    

}
//background view
@property (weak, nonatomic) IBOutlet UIToolbar *backgroundColorView;
@end
