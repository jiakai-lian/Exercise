//
//  AppDelegate.h
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "LocationHandler.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) LocationHandler *locationHanlder;// a location handler to update location

//@property(readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property(readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//@property(readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//
//- (void)saveContext;
//
//- (NSURL *)applicationDocumentsDirectory;


@end

