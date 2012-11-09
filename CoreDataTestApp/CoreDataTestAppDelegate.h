//
//  CoreDataTestAppDelegate.h
//  CoreDataTestApp
//
//  Created by Regie G. Pinat on 11/8/12.
//  Copyright (c) 2012 Regie G. Pinat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTestViewController.h"


@interface CoreDataTestAppDelegate : UIResponder <UIApplicationDelegate>

@property (retain, nonatomic) UIWindow *window;

@property (readonly, retain, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, retain, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, retain, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@property (nonatomic, retain) UINavigationController *navigationController;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
