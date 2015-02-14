//
//  CustomInfowindow.h
//  CmapusNavigation
//
//  Created by Xitao Lv on 3/30/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomInfowindow : UIView

// name of the building in info window
@property (weak, nonatomic) IBOutlet UILabel *name;

// address of the building info window
@property (weak, nonatomic) IBOutlet UILabel *address;

@end
