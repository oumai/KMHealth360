//
//  KMHHomeViewController.m
//  KMHealth360
//
//  Created by MichaeOu on 2018/3/29.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "KMHHomeViewController.h"

@interface KMHHomeViewController ()

@end

@implementation KMHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:view];
    
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image = [UIImage imageNamed:@"Consultation_selected"];
    [self.view addSubview:imageView];
    
}


@end
