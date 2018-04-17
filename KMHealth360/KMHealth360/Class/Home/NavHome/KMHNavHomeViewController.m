//
//  KMHNavHomeViewController.m
//  KMHealth360
//
//  Created by MichaeOu on 2018/3/29.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "KMHNavHomeViewController.h"
#import "AppDelegate.h"

#import "KMHHomeViewController.h"
#import "KMHFollowViewController.h"
#import "KMHConsultViewController.h"
#import "KMHHealthDocumentsViewController.h"
#import "KMHMeViewController.h"
@interface KMHNavHomeViewController ()

@end

@implementation KMHNavHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    //[self.navHomeView downImageAnimate];
    
    //    UITabBarController *tabBarController = (UITabBarController *)[UIApplication sharedApplication].windows[0].rootViewController;
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    for (UIViewController *vc in appDelegate.rootTabBarController.viewControllers) {
        UINavigationController *navVC = (UINavigationController *)vc;
        
        //        UIViewController *vc = navVC.viewControllers[0];
        //        vc.isFromRoundGuide = NO;
        
        if (navVC.viewControllers.count > 0) {
            
            if ([navVC.viewControllers[0] isKindOfClass:[KMHConsultViewController class]]) {
                KMHConsultViewController *consultationIndexVC = (KMHConsultViewController *)navVC.viewControllers[0];
                //consultationIndexVC.isFromRoundGuide = NO;
            } else if ([navVC.viewControllers[0] isKindOfClass:[KMHHealthDocumentsViewController class]]) {
                KMHHealthDocumentsViewController *healthDocumentsVC = (KMHHealthDocumentsViewController *)navVC.viewControllers[0];
                //healthDocumentsVC.isFromRoundGuide = NO;
            } else if ([navVC.viewControllers[0] isKindOfClass:[KMHHomeViewController class]]) {
                KMHHomeViewController *homeVC = (KMHHomeViewController *)navVC.viewControllers[0];
                //homeVC.isFromRoundGuide = NO;
            } else if ([navVC.viewControllers[0] isKindOfClass:[KMHMeViewController class]]) {
                KMHMeViewController *meVC = (KMHMeViewController *)navVC.viewControllers[0];
                //meVC.isFromRoundGuide = NO;
            } else if ([navVC.viewControllers[0] isKindOfClass:[KMHFollowViewController class]]) {
                KMHFollowViewController *healthFollowVC = (KMHFollowViewController *)navVC.viewControllers[0];
                //healthFollowVC.isFromRoundGuide = NO;
            }
        }
    }
    
    //self.isCurrentVC = YES;
}

@end
