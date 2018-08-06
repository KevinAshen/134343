//
//  RegisterViewController.m
//  2018.8.6 考核（朋友圈）
//
//  Created by 姜凯文 on 2018/8/6.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _accountTextField = [[UITextField alloc] initWithFrame:CGRectMake(120, 250, 200, 40)];
    _accountTextField.placeholder = @"请输入新账号";
    _accountTextField.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_accountTextField];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(120, 350, 200, 40)];
    _passwordTextField.placeholder = @"请输入新密码";
    _passwordTextField.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_passwordTextField];
    
    UIButton *finshButton = [[UIButton alloc] initWithFrame:CGRectMake(140, 450, 100, 30)];
    finshButton.backgroundColor = [UIColor blueColor];
    [finshButton setTitle:@"返回登录" forState:UIControlStateNormal];
    [finshButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [finshButton addTarget:self action:@selector(touchLand) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:finshButton];
    
 
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)returnText:(ReturnTextBlock)block{
    self.returnTextBlock = block;
}
-(void)viewWillDisappear:(BOOL)animated{
    if (self.returnTextBlock != nil) {
        self.returnTextBlock(self.accountTextField.text, self.passwordTextField.text);
    }
}

- (void) touchLand {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)keyboardWillDisAppear:(NSNotification *)notification{
    
    
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height-keyboardY);}];
    
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);}];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 必须辞去第一响应者后,键盘才会回缩.
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
