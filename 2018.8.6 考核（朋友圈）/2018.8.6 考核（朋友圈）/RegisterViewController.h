//
//  RegisterViewController.h
//  2018.8.6 考核（朋友圈）
//
//  Created by 姜凯文 on 2018/8/6.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
typedef void (^ReturnTextBlock)(NSString *showText, NSString *showText1);
@property (nonatomic,copy) ReturnTextBlock returnTextBlock;
- (void)returnText:(ReturnTextBlock)block;
@end
