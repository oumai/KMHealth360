//
//  KMHRootViewContronller.m
//  KMHealth360
//
//  Created by MichaeOu on 2018/3/29.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "KMHRootViewContronller.h"
#import "KMHHomeViewController.h"
#import "KMHFollowViewController.h"
#import "KMHConsultViewController.h"
#import "KMHHealthDocumentsViewController.h"
#import "KMHMeViewController.h"
#define STRING_LIGHT_COLOR UIColorFromHEX(0x999999, 1)
#define UIColorFromHEX(rgbValue,A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]

//渐变色
#define START_COLOR UIColorFromHEX(0x29ccbf, 1)
@interface KMHRootViewContronller ()<UITabBarControllerDelegate>

@end

@implementation KMHRootViewContronller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self configViewControllers];
    self.delegate = self;
}

- (void)configViewControllers
{
    
    KMHHomeViewController *home = [[KMHHomeViewController alloc] init];
    UINavigationController *navHome = [[UINavigationController alloc] initWithRootViewController:home];
    
    
    
    KMHFollowViewController *follow = [[KMHFollowViewController alloc] init];
    UINavigationController *navFollow = [[UINavigationController alloc] initWithRootViewController:follow];
    
    KMHHealthDocumentsViewController *health = [[KMHHealthDocumentsViewController alloc] init];
    UINavigationController *navHealth = [[UINavigationController alloc] initWithRootViewController:health];
    
    
    KMHConsultViewController *consult = [[KMHConsultViewController alloc] init];
    UINavigationController *navConsult = [[UINavigationController alloc] initWithRootViewController:consult];
    
    
    
    KMHMeViewController *me =[[KMHMeViewController alloc] init];
    UINavigationController *navMe = [[UINavigationController alloc] initWithRootViewController:me];
    
    self.viewControllers = @[navHome,navFollow,navHealth,navConsult,navMe];
    
    [self customizeTabBarForController];
    
}


- (void)customizeTabBarForController
{
    
    NSArray *tabBarImagesArray = @[@"Home", @"HealthFollow", @"HealthDocuments", @"Consultation", @"Me"];
    NSArray *tabBarItemTitlesArray = @[@"首页", @"关注", @"健康360", @"咨询", @"个人中心"];
    
    NSInteger index = 0;
    
    
    for (UIViewController *vc in self.viewControllers) {
        
        
        UITabBarItem *tabBarItem = vc.tabBarItem;
        tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",[tabBarImagesArray objectAtIndex:index]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",[tabBarImagesArray objectAtIndex:index]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabBarItem.title = [tabBarItemTitlesArray objectAtIndex:index];
        
        [tabBarItem setTitleTextAttributes:@{
                                             NSFontAttributeName: [UIFont systemFontOfSize:13],
                                             NSForegroundColorAttributeName:STRING_LIGHT_COLOR,
                                             } forState:UIControlStateNormal];
        
        
        [tabBarItem setTitleTextAttributes:@{
                                             NSFontAttributeName: [UIFont systemFontOfSize:13],
                                             NSForegroundColorAttributeName:START_COLOR,
                                             } forState:UIControlStateSelected];
        
        index++;
    }
    
}

@end
