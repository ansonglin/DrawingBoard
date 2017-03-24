//
//  AppDelegate.h
//  画图
//
//  Created by asl on 2016/11/21.
//  Copyright © 2016年 Invisionhealth Digital Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

