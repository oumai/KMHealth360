//
//  KMHMeTableViewCell.m
//  KMHealth360
//
//  Created by MichaeOu on 2018/3/30.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "KMHMeTableViewCell.h"

@implementation KMHMeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self pageLayout];
        
    }
    
    return self;

}

- (void)pageLayout
{
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.image = [UIImage imageNamed:@""];
    self.iconImageView.contentMode = UIViewContentModeCenter;
    [self.contentView addSubview:self.iconImageView];
    
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
        make.left.equalTo(self.mas_left).offset(10);
        make.size.mas_offset(CGSizeMake(17, 21));
    }];
    
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"";
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textColor = UIColorFromHEX(0x333333, 1);
    [self.contentView addSubview:self.titleLabel];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
        //make.width.equalTo(self.titleLabel.mas_width);//宽度可以不用设定
    }];
    
    self.arrowImage = [[UIImageView alloc] init];
    self.arrowImage.image = [UIImage imageNamed:@""];
    [self.contentView addSubview:self.arrowImage];
    
    [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.size.mas_offset(CGSizeMake(42, 20));
    }];
}

@end
