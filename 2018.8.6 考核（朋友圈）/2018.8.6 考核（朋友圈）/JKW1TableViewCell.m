//
//  JKW1TableViewCell.m
//  2018.8.6 考核（朋友圈）
//
//  Created by 姜凯文 on 2018/8/6.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "JKW1TableViewCell.h"

@implementation JKW1TableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.headImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_headImageView];
        
        self.bigImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_bigImageView];
        
        self.stressLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_stressLabel];
        
        self.dateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_dateLabel];
        
        self.coinImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_coinImageView];
        
        self.loveLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_loveLabel];
    }
    return self;
}
- (void) layoutSubviews {
    _headImageView.frame = CGRectMake(0, 0, 40, 40);
    
    _bigImageView.frame = CGRectMake(60, 60, 80, 100);
    
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
