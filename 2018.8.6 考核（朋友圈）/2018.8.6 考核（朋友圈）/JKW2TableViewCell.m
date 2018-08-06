//
//  JKW2TableViewCell.m
//  2018.8.6 考核（朋友圈）
//
//  Created by 姜凯文 on 2018/8/6.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "JKW2TableViewCell.h"

@implementation JKW2TableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.headImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headImageView];
        
        self.wordLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.wordLabel];
        
        self.bigImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.bigImageView];
        
        self.stressLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.stressLabel];
        
        self.dateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.dateLabel];
        
        self.coinImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.coinImageView];
        
        self.loveLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.loveLabel];
    }
    return self;
}
- (void) layoutSubviews {
    _headImageView.frame = CGRectMake(10, 10, 40, 40);
    
    _wordLabel.frame = CGRectMake(60, 60, 100, 40);
    
    _bigImageView.frame = CGRectMake(60, 110, 80, 50);
    
    _stressLabel.frame = CGRectMake(60, 170, 150, 20);
    
    _dateLabel.frame = CGRectMake(60, 200, 80, 20);
    
    _coinImageView.frame = CGRectMake(370, 230, 30, 20);
    
    _loveLabel.frame = CGRectMake(60, 230, 300, 40);
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
