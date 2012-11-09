//
//  CoreDataTestViewController.h
//  CoreDataTestApp
//
//  Created by Regie G. Pinat on 11/8/12.
//  Copyright (c) 2012 Regie G. Pinat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalInfo.h"
@interface CoreDataTestViewController : UITableViewController 
{
    double x;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSMutableArray *personalInfoArray;
- (void) fetchRecords;
- (void) addTime:(id)sender;
-(void)toggleEditingMode:(id)sender;
@end
