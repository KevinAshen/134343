//
//  FriendsViewController.m
//  2018.8.6 考核（朋友圈）
//
//  Created by 姜凯文 on 2018/8/6.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "FriendsViewController.h"
#import "JKW1TableViewCell.h"
#import "JKW2TableViewCell.h"

@interface FriendsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.22f blue:0.25f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    
    self.view.backgroundColor = [UIColor lightGrayColor];

    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 5, 414, 736) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];
    [self.tableView registerClass:[JKW1TableViewCell class]  forCellReuseIdentifier:@"cell1"];
    [self.tableView registerClass:[JKW2TableViewCell class]  forCellReuseIdentifier:@"cell2"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UIView* titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    _tableView.tableHeaderView = titleView;
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3.jpg"]];
    [backImageView setFrame:CGRectMake(0, 0, 414, 250)];
    [titleView addSubview:backImageView];
    
    UIImageView *iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4.jpg"]];
    [iconImageView setFrame:CGRectMake(350, 220, 50, 50)];
    [titleView addSubview:iconImageView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 250, 40, 20)];
    nameLabel.text = @"Blithe";
    nameLabel.textColor = [UIColor whiteColor];
    [titleView addSubview:nameLabel];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *headImageNSA = [NSArray arrayWithObjects:[UIImage imageNamed:@"1.jpg"], [UIImage imageNamed:@"2.jpg"], [UIImage imageNamed:@"3.jpg"], [UIImage imageNamed:@"4.jpg"], [UIImage imageNamed:@"5.jpg"], [UIImage imageNamed:@"6.jpg"], [UIImage imageNamed:@"7.jpg"], [UIImage imageNamed:@"8.jpg"], [UIImage imageNamed:@"9.jpg"], [UIImage imageNamed:@"10.jpg"], [UIImage imageNamed:@"11.jpg"], [UIImage imageNamed:@"12.jpg"], [UIImage imageNamed:@"13.jpg"], [UIImage imageNamed:@"14.jpg"], nil];
    
    NSArray *bigImageNSA = [NSArray arrayWithObjects:[UIImage imageNamed:@"2.jpg"], [UIImage imageNamed:@"1.jpg"], [UIImage imageNamed:@"4.jpg"], [UIImage imageNamed:@"3.jpg"], [UIImage imageNamed:@"6.jpg"], [UIImage imageNamed:@"5.jpg"], [UIImage imageNamed:@"8.jpg"], [UIImage imageNamed:@"7.jpg"], [UIImage imageNamed:@"10.jpg"], [UIImage imageNamed:@"9.jpg"], [UIImage imageNamed:@"12.jpg"], [UIImage imageNamed:@"11.jpg"], [UIImage imageNamed:@"14.jpg"], [UIImage imageNamed:@"13.jpg"], nil];
    
    NSArray *stressTextNSA = [NSArray arrayWithObjects:@"北京1", @"北京2" ,@"北京3", @"北京4", @"北京5", @"北京6", @"北京7", @"北京8", @"北京9", @"北京10", @"北京11", @"北京12", @"北京13", @"北京14", nil];
    
    NSArray *dateTextNSA = [NSArray arrayWithObjects:@"1号", @"2号", @"3号", @"4号", @"5号", @"6号", @"7号", @"8号", @"9号", @"10号", @"11号", @"12号", @"13号", @"14号" ,nil];
    
    NSArray *nameTextNSA = [NSArray arrayWithObjects:@"小1", @"小2", @"小3", @"小4", @"小5", @"小6", @"小7", @"小8", @"小9", @"小10", @"小11", @"小12", @"小13", @"小14", nil];
    if (indexPath.row % 2 == 0) {
        JKW1TableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"forIndexPath:indexPath];
        cell1.headImageView = headImageNSA[indexPath.row];
        cell1.bigImageView = bigImageNSA[indexPath.row];
        cell1.stressLabel = stressTextNSA[indexPath.row];
        cell1.dateLabel = dateTextNSA[indexPath.row];
        [cell1.coinImageView setImage:[UIImage imageNamed:@"back_img"]];
        cell1.loveLabel = nameTextNSA[indexPath.row];
        
        return cell1;
    }
    else {
        JKW2TableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"forIndexPath:indexPath];
        
        cell2.wordLabel = stressTextNSA[indexPath.row];
        cell2.headImageView = headImageNSA[indexPath.row];
        cell2.bigImageView = bigImageNSA[indexPath.row];
        cell2.stressLabel = stressTextNSA[indexPath.row];
        cell2.dateLabel = dateTextNSA[indexPath.row];
        [cell2.coinImageView setImage:[UIImage imageNamed:@"back_img"]];
        cell2.loveLabel = nameTextNSA[indexPath.row];

        
        return cell2;
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 14;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
