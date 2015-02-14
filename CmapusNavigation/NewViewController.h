//
//  NewViewController.h
//  CmapusNavigation
//
//  Created by Xitao Lv on 2/8/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

// a viewcontroller to test shareapplication in subview

@interface NewViewController : UIViewController<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *childView;


@end
