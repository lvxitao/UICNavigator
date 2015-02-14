//
//  GViewController.h
//  CmapusNavigation
//
//  Created by Xitao Lv on 4/13/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

//the class should set up tp GMSMapViewDelegete and UITextFieldDelegate
//in order to implement google maps SDK and textfield 
@interface GViewController : UIViewController<GMSMapViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *startText;
@property (weak, nonatomic) IBOutlet UITextField *endText;
@property(nonatomic, retain) UIBarButtonItem *exploreButtonItem;
@property(nonatomic, retain) UIBarButtonItem *searchBarButtonItem;


- (IBAction)Direction:(UIButton *)sender;
//-(BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
