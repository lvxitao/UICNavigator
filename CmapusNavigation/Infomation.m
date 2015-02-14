//
//  Infomation.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 4/11/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "Infomation.h"
//a class to store infomation of all places in UIC

@implementation Infomation
@synthesize name;
@synthesize address;
@synthesize latitude;
@synthesize longtitude;
@synthesize tag;
@synthesize imagePath;
@synthesize departmentTag;

//a method to construct a place
-(id)initWithName:(NSString *)newname address:(NSString *)newaddress latitude:(NSNumber *)newlatitude longtitude:(NSNumber *)newlongtitude tag:(NSString *)newtag image:(NSString *)newimagePath department:(NSString*)newdepartment
{
    self = [super init];
    self.name = newname;
    self.address = newaddress;
    self.latitude = newlatitude;
    self.longtitude = newlongtitude;
    self.tag = newtag;
    self.imagePath = newimagePath;
    self.departmentTag = newdepartment;
    return self;
}

//get name from a place
-(NSString *)getName{
    return name;
}
@end
