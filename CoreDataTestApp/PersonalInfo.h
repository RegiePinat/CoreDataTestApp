//
//  PersonalInfo.h
//  CoreDataTestApp
//
//  Created by Regie G. Pinat on 11/8/12.
//  Copyright (c) 2012 Regie G. Pinat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PersonalInfo : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic) int32_t age;
@property (nonatomic) double orderID;

@end
