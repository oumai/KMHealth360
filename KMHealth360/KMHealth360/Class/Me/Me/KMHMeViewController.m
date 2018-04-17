//
//  KMHMeViewController.m
//  KMHealth360
//
//  Created by MichaeOu on 2018/3/29.
//  Copyright © 2018年 康美. All rights reserved.
//
#define UIColorFromRGB(R,G,B,A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#import "KMHMeViewController.h"
#import "KMHMeTableViewCell.h"
#import "BATMeSectionHeaderView.h"
#import "BATUserInfoView.h"
static NSString *identifier = @"cellIdentifier";
@interface KMHMeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong) BATUserInfoView *userInfoView;

@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@end

@implementation KMHMeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSourceArray = [NSMutableArray arrayWithObjects:
                            
                            @[
                              //                     @{@"title":@"个人资料",@"image":@"person_grzl"},
                              @{@"title":@"就诊人管理",@"image":@"personCenter_Health_archives"},
                              @{@"title":@"我的收藏",@"image":@"personCenter_collect"},
                              @{@"title":@"会员中心",@"image":@"personCenter_collect"},
                              //@{@"title":@"我的优惠码",@"image":@"personCenter_yhm"},
                              ],
                            
                            @[
                              @{@"title":@"防癌筛查订单",@"image":@"icon_fatj"},
                              @{@"title":@"药品订单",@"image":@"icon-wdcfd"},
                              @{@"title":@"我的收货地址",@"image":@"icon-wdshd"},
                              ],
                            @[
                              
                              //@{@"title":@"咨询医生订单",@"image":@"personCenter_zixun"},
                              @{@"title":@"医生工作室订单",@"image":@"personCenter_jydd"},
                              @{@"title":@"物流订单",@"image":@"personCenter_logistics"},
                              @{@"title":@"服务记录",@"image":@"personCenter_Service_record"},
                              
                              ],
                            
                            @[
                              @{@"title":@"设置",@"image":@"personCenter_setting"},
                              @{@"title":@"客服电话",@"image":@"personCenter_phone"},
                              ], nil];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.bounces = NO;
    self.tableView.separatorColor = UIColorFromRGB(227, 227, 228, 1);
    self.tableView.backgroundColor = UIColorFromRGB(227, 227, 228, 1);
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(-20);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
    
    _userInfoView = [[BATUserInfoView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 369*0.5+20)];
    _tableView.tableHeaderView = _userInfoView;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSourceArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionArray = _dataSourceArray[section];
    return sectionArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section != 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
        return view;
    }
    
    BATMeSectionHeaderView *sectionView = [[BATMeSectionHeaderView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 120)];

    return sectionView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  section == 0 ? 120 : 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KMHMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == cell) {
        
        cell = [[KMHMeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    NSArray *sectionArray = _dataSourceArray[indexPath.section];
    
    NSDictionary *dic = sectionArray[indexPath.row];
    
    
    cell.iconImageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"title"]];
    
    
    return cell;
}
@end
