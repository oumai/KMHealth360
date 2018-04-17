//
//  KMHHealthDocumentsViewController.m
//  KMHealth360
//
//  Created by MichaeOu on 2018/3/30.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "KMHHealthDocumentsViewController.h"

@interface KMHHealthDocumentsViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation KMHHealthDocumentsViewController


- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.view addSubview:self.webView];
    
    
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(-20);
        make.left.right.bottom.equalTo(self.view);
    }];
    [self loadURL];
}

- (void)loadURL
{
    NSString *httpG = @"http://djymbgl.kmhealthcloud.com:9003";
    NSString *appkey = @"e38ad4f48133c76ad8e6165ccc427211";
    NSString *appSecret = @"dbf2dcc52133c76ad8e61600eeafa583";
    NSString *timestamp = [Tools getDateStringWithDate:[NSDate date] Format:@"yyyy-MM-dd HH:mm:ss"];//当前日期
    NSString *phone = @"15013769520";//person.Data.PhoneNumber;//手机号
    
    NSArray *array = @[appkey,appSecret,timestamp];

    array = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSString *tmpSign = @"";

    for (NSString *string in array) {
        tmpSign = [tmpSign stringByAppendingString:string];
    }
    
    NSString *sign = [Tools md5String:tmpSign];
    
    NSString *url = [NSString stringWithFormat:@"%@?appkey=%@&timestamp=%@&sign=%@&phone=%@&src=2",httpG,appkey,timestamp,sign,phone];
    
     url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
     
     
     
     NSLog(@"Encodingurl= %@",url);
     [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}


- (UIWebView *)webView
{
    if (!_webView) {
        
        _webView = [[UIWebView alloc] initWithFrame:CGRectZero];
        _webView.delegate = self;
        
    }
    return _webView;
}
@end
