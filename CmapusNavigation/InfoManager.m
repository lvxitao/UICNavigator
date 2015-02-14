//
//  InfoManager.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 4/11/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "InfoManager.h"

// a InfoManager to initialize a info with all places in UIC
@implementation InfoManager
- (id)init
{
    self = [super init];
    if (self) {
    	// initial infomation for maps
        info = [NSMutableArray arrayWithArray:
                @[[[Infomation alloc] initWithName:@"Art and Architecture Bldg" address:@"845 W Harrison St" latitude:[NSNumber numberWithDouble:41.873669] longtitude:[NSNumber numberWithDouble:-87.648775] tag:@"East" image:@"art&architecture1.JPG" department:@"school of Architecture"],
                
                  [[Infomation alloc] initWithName:@"Art & Design Hal" address:@"400 South Peoria Street" latitude:[NSNumber numberWithDouble:41.876374] longtitude:[NSNumber numberWithDouble:-87.649890] tag:@"East"    image:@"art&designhall1.jpg" department:@""],
                  [[Infomation alloc] initWithName:@"Addams Hall" address:@"830 South Halsted Street" latitude:[NSNumber numberWithDouble:41.870981] longtitude:[NSNumber numberWithDouble:-87.649095] tag:@"East" image:@"Addamshall.png" department:@""],
                  [[Infomation alloc] initWithName:@"Burnham Hall" address:@"828 South Halsted Street" latitude:[NSNumber numberWithDouble:41.870982] longtitude:[NSNumber numberWithDouble:-87.649456] tag:@"East" image:@"Burnham Hall.png" department:@""],
                  [[Infomation alloc] initWithName:@"Behavioral Sciences Bldg (BSB)" address:@"1007 West Harrison Street" latitude:[NSNumber numberWithDouble:41.873822] longtitude:[NSNumber numberWithDouble:-87.652996] tag:@"East" image:@"BSB1.jpg" department:@"Department of Communication\nDepartment of Anthropology"],
                  [[Infomation alloc] initWithName:@"College of Urban Planning & Public Affairs Hall" address:@"412 South Peoria Street" latitude:[NSNumber numberWithDouble:41.876389] longtitude:[NSNumber numberWithDouble:-87.650472] tag:@"East" image:@"UrbanPlanning.png" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Douglas Hall" address:@"705 South Morgan Street" latitude:[NSNumber numberWithDouble:41.872794] longtitude:[NSNumber numberWithDouble:-87.649087] tag:@"East" image:@"douglas-hall.jpg" department:@"LIAUTAUD GRADUATE SCHOOL OF BUSINESS"],
                  
                  [[Infomation alloc] initWithName:@"Education, Performing Arts &Social Work" address:@"1040 W Harrison St" latitude:[NSNumber numberWithDouble:41.874931] longtitude:[NSNumber numberWithDouble:-87.652918] tag:@"East" image:@"Education.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Engineering Research Facility(ERF)" address:@"842 W Taylor St" latitude:[NSNumber numberWithDouble:41.869696] longtitude:[NSNumber numberWithDouble:-87.647894] tag:@"East" image:@"ERF.jpg" department:@"Department of civil and metallurgy\nDepartment of Mechanical & Industrial Engineering"],
                  
                  [[Infomation alloc] initWithName:@"UIC Flames" address:@"839 W Roosevelt Rd #237E" latitude:[NSNumber numberWithDouble:41.866560] longtitude:[NSNumber numberWithDouble:-87.648345] tag:@"South" image:@"FlamesCenter.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"UIC Forum" address:@"725 W Roosevelt Rd" latitude:[NSNumber numberWithDouble:41.866884] longtitude:[NSNumber numberWithDouble:-87.646153] tag:@"East" image:@"UICForum.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Grant Hall" address:@"703 South Morgan Street" latitude:[NSNumber numberWithDouble:41.872840] longtitude:[NSNumber numberWithDouble:-87.649451] tag:@"East" image:@"GrantHall.jpg" department:@""],
                  [[Infomation alloc] initWithName:@"Henry Hall" address:@"935 West Harrison Street" latitude:[NSNumber numberWithDouble:41.874068] longtitude:[NSNumber numberWithDouble:-87.650552] tag:@"East" image:@"HenryHall.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Halsted Street Parking Structure" address:@"1100 West Harrison Street" latitude:[NSNumber numberWithDouble:41.870652] longtitude:[NSNumber numberWithDouble:-87.646254] tag:@"East" image:@"HSPS1.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Harrison Street Parking Structure" address:@"801 South Halsted Street" latitude:[NSNumber numberWithDouble:41.874860] longtitude:[NSNumber numberWithDouble:-87.655155] tag:@"East" image:@"HSPS2.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Jane Addams Hull-House Museum" address:@"800 South Halsted Street" latitude:[NSNumber numberWithDouble:41.871666] longtitude:[NSNumber numberWithDouble:-87.647381] tag:@"East" image:@"Hull_House_2.JPG" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Jefferson Hall" address:@"929 West Harrison Street" latitude:[NSNumber numberWithDouble:41.874025] longtitude:[NSNumber numberWithDouble:-87.650222] tag:@"East" image:@"JeffersonHall.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Lecture Center A" address:@"805 South Morgan Street" latitude:[NSNumber numberWithDouble:41.872007] longtitude:[NSNumber numberWithDouble:-87.649854] tag:@"East" image:@"LC.jpg" department:@""],
                  [[Infomation alloc] initWithName:@"Lecture Center B" address:@"803 South Morgan Street" latitude:[NSNumber numberWithDouble:41.872217] longtitude:[NSNumber numberWithDouble:-87.649198] tag:@"East" image:@"LC.jpg" department:@""],
                  [[Infomation alloc] initWithName:@"Lecture Center C" address:@"802 South Morgan Street" latitude:[NSNumber numberWithDouble:41.872161] longtitude:[NSNumber numberWithDouble:-87.648636] tag:@"East" image:@"LC.jpg" department:@""],
                  [[Infomation alloc] initWithName:@"Lecture Center D" address:@"804 South Morgan Street" latitude:[NSNumber numberWithDouble:41.871684] longtitude:[NSNumber numberWithDouble:-87.648612] tag:@"East" image:@"LC.jpg" department:@""],
                  [[Infomation alloc] initWithName:@"Lecture Center E" address:@"806 South Morgan Street" latitude:[NSNumber numberWithDouble:41.871597] longtitude:[NSNumber numberWithDouble:-87.649201] tag:@"East" image:@"LC.jpg" department:@""],
                  [[Infomation alloc] initWithName:@"Lecture Center F" address:@"807 South Morgan Street" latitude:[NSNumber numberWithDouble:41.871722] longtitude:[NSNumber numberWithDouble:-87.649722] tag:@"East" image:@"LC.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Lincoln Hall" address:@"707 S Morgan St" latitude:[NSNumber numberWithDouble:41.872490] longtitude:[NSNumber numberWithDouble:-87.649240] tag:@"East" image:@"lincoln-hall1.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Library, Richard J. Daley" address:@"801 S Morgan St" latitude:[NSNumber numberWithDouble:41.871980] longtitude:[NSNumber numberWithDouble:-87.650563] tag:@"East" image:@"EastLib.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Marie Robinson Hall" address:@"811 W. Maxwell Street" latitude:[NSNumber numberWithDouble:41.864097] longtitude:[NSNumber numberWithDouble:-87.647702] tag:@"South" image:@"mrh_outside.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@" Maxwell Street Parking Structure" address:@"701 West Maxwell Street" latitude:[NSNumber numberWithDouble:41.864611] longtitude:[NSNumber numberWithDouble:-87.645838] tag:@"South" image:@"MarkswellParking.png" department:@""],
                  
                  [[Infomation alloc] initWithName:@"UIC Pavilion" address:@"525 S Racine Ave" latitude:[NSNumber numberWithDouble:41.874852] longtitude:[NSNumber numberWithDouble:-87.656154] tag:@"East" image:@"Uic_pavilion.JPG" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Physical Education Bldg" address:@"901 West Roosevelt Road" latitude:[NSNumber numberWithDouble:41.866586] longtitude:[NSNumber numberWithDouble:-87.649629] tag:@"South" image:@"PEB.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Plant Research Laboratory" address:@"1020 South Union Street" latitude:[NSNumber numberWithDouble:41.869161] longtitude:[NSNumber numberWithDouble:-87.646147] tag:@"East" image:@"PRL.png" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Physical Plant Bldg" address:@"1140 South Morgan Street" latitude:[NSNumber numberWithDouble:41.867597] longtitude:[NSNumber numberWithDouble:-87.652320] tag:@"South" image:@"PPB.png" department:@""],
                  
                  [[Infomation alloc] initWithName:@"UIC Police Station" address:@"943 W Maxwell St" latitude:[NSNumber numberWithDouble:41.866586] longtitude:[NSNumber numberWithDouble:-87.649629] tag:@"South" image:@"UICPolice.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Sangamon Center Building" address:@"412 South Peoria Street" latitude:[NSNumber numberWithDouble:41.876389] longtitude:[NSNumber numberWithDouble:-87.650472] tag:@"East" image:@"UrbanPlanning.png" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Student Center East(SCE)" address:@"412 South Peoria Street" latitude:[NSNumber numberWithDouble:41.871910] longtitude:[NSNumber numberWithDouble:-87.650472] tag:@"East" image:@"UIC_Student_Center_East.JPG" department:@"UIC Bookstore\nUNIVERSITY OF ILLINOIS ALUMNI ASSOCIATION - CHICAGO"],
                  
                  [[Infomation alloc] initWithName:@"Science & Engineering Laboratory (SEL)" address:@"900 W Taylor St " latitude:[NSNumber numberWithDouble:41.870488] longtitude:[NSNumber numberWithDouble:-87.648498] tag:@"East" image:@"SEL.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Science and Engineering Offices(SEO)" address:@"851 South Morgan Street" latitude:[NSNumber numberWithDouble:41.870783] longtitude:[NSNumber numberWithDouble:-87.65061] tag:@"East" image:@"SEO.jpg" department:@"Department of Computer Science\nDept. of Electrical & Computer Engineering\nDepartment of Math,Statistics and Computer Science MSCS "],
                  
                  [[Infomation alloc] initWithName:@" Science and Engineering South(SES)" address:@"845 West Taylor Street" latitude:[NSNumber numberWithDouble:41.868971] longtitude:[NSNumber numberWithDouble:-87.648399] tag:@"East" image:@"SES.jpg" department:@"Department of Biological Sciences"],
                  
                  [[Infomation alloc] initWithName:@"Stevenson Hall" address:@"701 South Morgan Street" latitude:[NSNumber numberWithDouble:41.872871] longtitude:[NSNumber numberWithDouble:-87.650379] tag:@"East" image:@"Stevenson Hall.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Student Residence & Commons Courtyard(SRCC)" address:@"600 South Halsted Street" latitude:[NSNumber numberWithDouble:41.874221] longtitude:[NSNumber numberWithDouble:-87.647954] tag:@"East" image:@"SRCC.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Student Recreation Facility" address:@"737 S. Halsted St" latitude:[NSNumber numberWithDouble:41.872477] longtitude:[NSNumber numberWithDouble:-87.646619] tag:@"East" image:@"gymEast.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Student Services Bldg(SSB)" address:@"1200 West Harrison Street" latitude:[NSNumber numberWithDouble:41.874927] longtitude:[NSNumber numberWithDouble:-87.658256] tag:@"East" image:@"SSB.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Thomas Beckham Hall" address:@"1250 S Halsted St" latitude:[NSNumber numberWithDouble:41.865635] longtitude:[NSNumber numberWithDouble:-87.647111] tag:@"South" image:@"mrh_outside.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Transportation Facility" address:@"1351 South Morgan Street" latitude:[NSNumber numberWithDouble:41.863995] longtitude:[NSNumber numberWithDouble:-87.650630] tag:@"East" image:@"TF.png" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Taft Hall" address:@"826 South Halsted Street" latitude:[NSNumber numberWithDouble:41.871295] longtitude:[NSNumber numberWithDouble:-87.649220] tag:@"East" image:@"Taft Hall.png" department:@""],
                  
                  [[Infomation alloc] initWithName:@"University Hall" address:@"601 South Morgan Street" latitude:[NSNumber numberWithDouble:41.873859] longtitude:[NSNumber numberWithDouble:-87.650972] tag:@"East" image:@"UIC_UniversityHall.jpg" department:@"Office of Development\nDepartment of German Studies\nGraduate College\nDepartment of Latin American Studies"],
                  
                  [[Infomation alloc] initWithName:@"UIC Theater" address:@"1044 West Harrison Street" latitude:[NSNumber numberWithDouble:41.874558] longtitude:[NSNumber numberWithDouble:-87.653315] tag:@"East" image:@"Theater.png" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Utilities Bldg" address:@"1100 South Morgan Street" latitude:[NSNumber numberWithDouble:41.868465] longtitude:[NSNumber numberWithDouble: -87.651688] tag:@"East" image:@"Utilities.png" department:@""],
                  
                  [[Infomation alloc] initWithName:@"college of Nursing" address:@"845 South Damen" latitude:[NSNumber numberWithDouble:41.869976] longtitude:[NSNumber numberWithDouble: -87.675171] tag:@"West" image:@"nursing.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Applied Health Sciences Building(AHSB)" address:@"1919 West Taylor Street" latitude:[NSNumber numberWithDouble:41.868558] longtitude:[NSNumber numberWithDouble: -87.674764] tag:@"West" image:@"AHSB.jpg" department:@"Department of BIOMEDICAL AND HEALTH INFORMATION SCIENCES\nDepartment of DISABILITY AND HUMAN DEVELOPMENT Department of KINESIOLOGY AND NUTRITION\nDepartment of OCCUPATIONAL THERAPY\nDepartment of PHYSICAL THERAPY"],
                  
                  [[Infomation alloc] initWithName:@"Lions of Illinois Eye Research Institute-LIERI" address:@"1905 West Taylor Street" latitude:[NSNumber numberWithDouble:41.868866] longtitude:[NSNumber numberWithDouble: -87.674015] tag:@"West" image:@"lieri.png" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Outpatient Care Center(OCC)" address:@"1801 West Taylor Street" latitude:[NSNumber numberWithDouble:41.868794] longtitude:[NSNumber numberWithDouble: -87.672004] tag:@"West" image:@"occ.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"UIC Hospital-UICH" address:@"1740 West Taylor Street" latitude:[NSNumber numberWithDouble:41.869393] longtitude:[NSNumber numberWithDouble: -87.670421] tag:@"West" image:@"uichospital.jpg" department:@""],
                  
                  
                  [[Infomation alloc] initWithName:@"College of Pharmacy" address:@"833 South Wood Street" latitude:[NSNumber numberWithDouble:41.870552] longtitude:[NSNumber numberWithDouble: -87.670646] tag:@"West" image:@"pharmacy.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Library of Health Sciences(LHS)" address:@"1750 West Polk Street" latitude:[NSNumber numberWithDouble:41.871734] longtitude:[NSNumber numberWithDouble:-87.670743] tag:@"West" image:@"lhs.jpeg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Biologic Research Lab(BRL)" address:@"1840 West Taylor Street" latitude:[NSNumber numberWithDouble:41.869405] longtitude:[NSNumber numberWithDouble:-87.672572] tag:@"West" image:@"biology research lab.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"College of Medicine Research Building(COMRB)" address:@"1819 West Polk Street" latitude:[NSNumber numberWithDouble:41.869689] longtitude:[NSNumber numberWithDouble: -87.673232] tag:@"West" image:@"COMRB.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Neuropyschiatric Institute" address:@"912 South Wood Street" latitude:[NSNumber numberWithDouble:41.870024] longtitude:[NSNumber numberWithDouble: -87.671612] tag:@"West" image:@"NPI.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Clinical Sciences North(CSN)" address:@"820 South Wood Street" latitude:[NSNumber numberWithDouble:41.870911] longtitude:[NSNumber numberWithDouble: -87.671805] tag:@"West" image:@"CSB.jpg" department:@"Campus Care"],
                  
                  [[Infomation alloc] initWithName:@"College of Dentistry" address:@"801 South Paulina" latitude:[NSNumber numberWithDouble:41.871187] longtitude:[NSNumber numberWithDouble: -87.668597] tag:@"West" image:@"dentistry.jpeg" department:@""],
                  [[Infomation alloc] initWithName:@"Disablility,Health and Social Policy Building(DHSP)" address:@"1640 West Roosevelt Road" latitude:[NSNumber numberWithDouble:41.867392] longtitude:[NSNumber numberWithDouble: -87.667632] tag:@"West" image:@"DHSP.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"School of Public Health and Psychiatric Insti." address:@"1601 West Taylor Street" latitude:[NSNumber numberWithDouble:41.86867] longtitude:[NSNumber numberWithDouble: -87.667336] tag:@"West" image:@"UIC Psychiatric Inst.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"Center for Strutural Biology CFSB" address:@"1100 S. Ashland Avenue" latitude:[NSNumber numberWithDouble:41.868127] longtitude:[NSNumber numberWithDouble: -87.665759] tag:@"West" image:@"CFSB.jpg" department:@""],
                  
                  [[Infomation alloc] initWithName:@"West Side Research Office Building" address:@"1747 West Roosevelt Road" latitude:[NSNumber numberWithDouble:41.866373] longtitude:[NSNumber numberWithDouble: -87.670609] tag:@"West" image:@"WROB.jpg" department:@""],
                  ]];
        
        
   

                
    }
    return self;
}

//get infomation of all places in UIC
-(NSArray*)getInfo
{
    return info;
}


@end
