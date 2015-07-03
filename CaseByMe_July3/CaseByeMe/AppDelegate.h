//
//  AppDelegate.h
//  CaseByeMe
//
//  Created by Dextrotech on 07/05/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ELCImagePickerDemoViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
#define DELEGATE ((AppDelegate*)[[UIApplication sharedApplication]delegate])
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong)  ELCImagePickerDemoViewController *viewController;
@property (strong, nonatomic) NSMutableArray *galleryArray;

@end

