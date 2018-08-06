//
//  LandViewController.m
//  2018.8.6 考核（朋友圈）
//
//  Created by 姜凯文 on 2018/8/6.
//  Copyright © 2018年 姜凯文. All rights reserved.
//414 736

#import "LandViewController.h"
#import "RegisterViewController.h"
#import "FriendsViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@interface LandViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UITextField *passwordTextField;

@end

@implementation LandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _accountTextField = [[UITextField alloc] initWithFrame:CGRectMake(120, 250, 200, 40)];
    _accountTextField.placeholder = @"请输入账号";
    _accountTextField.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_accountTextField];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(120, 350, 200, 40)];
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_passwordTextField];
    
    UIButton *landButton = [[UIButton alloc] initWithFrame:CGRectMake(140, 450, 40, 30)];
    landButton.backgroundColor = [UIColor blueColor];
    [landButton setTitle:@"登录" forState:UIControlStateNormal];
    [landButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [landButton addTarget:self action:@selector(touchLand) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landButton];
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 450, 40, 30)];
    registerButton.backgroundColor = [UIColor blueColor];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(touchRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)touchRegister {
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    [registerViewController returnText:^(NSString *showText, NSString *showText1) {
        self.accountTextField.text = showText;
        self.passwordTextField.text = showText1;
        self.str1 = showText;
        self.str2 = showText1;
    }];
    
    [self presentViewController:registerViewController animated:YES completion:nil];
}

- (void)touchLand {
    FriendsViewController *friendsViewController = [[FriendsViewController alloc] init];
    UINavigationController *friendNav = [[UINavigationController alloc] initWithRootViewController:friendsViewController];
    
    OneViewController *oneViewController = [[OneViewController alloc] init];
    UINavigationController *oneNav = [[UINavigationController alloc] initWithRootViewController:oneViewController];
    
    TwoViewController *twoViewController = [[TwoViewController alloc] init];
    UINavigationController *twoNav = [[UINavigationController alloc] initWithRootViewController:twoViewController];
    
    UITabBarController *tabTabBarController = [[UITabBarController alloc] init];
    NSArray *navNSArry = [NSArray arrayWithObjects:friendNav, oneNav, twoNav, nil];
    tabTabBarController.viewControllers = navNSArry;
    
    _str3 = @"04151001";
    _str4 = @"1234567890";
    
    if (([self.accountTextField.text isEqualToString:_str1] && [self.passwordTextField.text isEqualToString:_str2]) || ([self.accountTextField.text isEqualToString:_str3] && [self.passwordTextField.text isEqualToString:_str4])) {
        [self presentViewController:tabTabBarController animated:YES completion:nil];
    }
    else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"账号或者密码错误" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
        [alertController addAction:deleteAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    

}
- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, 0);
        
    }];
}
- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);}];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
