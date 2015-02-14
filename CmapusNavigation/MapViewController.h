//
//  MapViewController.h
//  CmapusNavigation
//
//  Created by Xitao Lv on 1/25/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WestViewController.h"

@interface MapViewController : UIViewController
// west campus button
@property (weak, nonatomic) IBOutlet UIButton *west;
// east campus button
@property (weak, nonatomic) IBOutlet UIButton *east;
@property (weak, nonatomic) IBOutlet UIButton *south;



@end
