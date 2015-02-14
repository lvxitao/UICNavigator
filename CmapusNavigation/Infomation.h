//
//  Infomation.h
//  CmapusNavigation
//  infomation file include data structre for place infomation
//  Created by Xitao Lv on 4/11/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Infomation : NSObject{
    NSString *name;
    NSString *address;
    NSNumber *latitude;
    NSNumber *longtitude;
    NSString *tag;
    NSString *imagePath;
    NSString *departmentTag;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSNumber *latitude;
@property (nonatomic, copy) NSNumber *longtitude;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *departmentTag;

- (id)initWithName:(NSString*)name address:(NSString*)address latitude:(NSNumber*)latitude longtitude:(NSNumber*)longtitude tag:(NSString*) tag image:(NSString*) imagePath department:(NSString*) departmentTag;
- (NSString*) getName;

@end
