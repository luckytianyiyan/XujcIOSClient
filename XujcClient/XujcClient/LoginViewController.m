//
//  ViewController.m
//  XujcClient
//
//  Created by 田奕焰 on 15/10/30.
//  Copyright © 2015年 luckytianyiyan. All rights reserved.
//

#import "LoginViewController.h"
#import "XujcAPI.h"
#import "DynamicData.h"

#import "XujcUser.h"

static const CGFloat kContentMarginHorizontal = 25.f;
static const CGFloat kTextFieldHeight = 40.f;
static const CGFloat kLoginButtonHeight = 40.f;

static const CGFloat kLoginButtonRadius = 4.f;

static const CGFloat kLoginButtonMarginVertical = 15.f;

@interface LoginViewController ()

@property (strong, nonatomic) UITextField *accountTextField;

@property (strong, nonatomic) UITextField *apiKeyTextField;
@property (strong, nonatomic) UILabel *apiKeyLeftView;
@property (strong, nonatomic) UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _accountTextField = [[UITextField alloc] init];
    _accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_accountTextField];
    
    _apiKeyLeftView = [[UILabel alloc] init];
    
    _apiKeyTextField = [[UITextField alloc] init];
    _apiKeyTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _apiKeyTextField.leftView = _apiKeyLeftView;
    _apiKeyTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_apiKeyTextField];
    
    _loginButton = [[UIButton alloc] init];
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    _loginButton.layer.cornerRadius = kLoginButtonRadius;
    [_loginButton addTarget:self action:@selector(onLoginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
#ifdef DEBUG
    _accountTextField.text = @"swe12023";
    _apiKeyLeftView.text = @"swe12023-";
    _apiKeyTextField.text = @"szyufvxh";
    
    _loginButton.backgroundColor = [UIColor blueColor];
    _accountTextField.backgroundColor = [UIColor redColor];
    _apiKeyTextField.backgroundColor = [UIColor redColor];
#endif
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGFloat fullWidth = CGRectGetWidth(self.view.bounds);
    CGFloat fullHeight = CGRectGetHeight(self.view.bounds);
    CGFloat contentWidth = fullWidth - 2 * kContentMarginHorizontal;
    
    [_apiKeyLeftView sizeToFit];
    
    _accountTextField.frame = CGRectMake(kContentMarginHorizontal, fullHeight / 2, contentWidth, kTextFieldHeight);
    _apiKeyTextField.frame = CGRectMake(kContentMarginHorizontal, CGRectGetMaxY(_accountTextField.frame), contentWidth, kTextFieldHeight);
    _loginButton.frame = CGRectMake(kContentMarginHorizontal, CGRectGetMaxY(_apiKeyTextField.frame) + kLoginButtonMarginVertical, contentWidth, kLoginButtonHeight);
}

#pragma mark - Event Response

- (void)onLoginButtonClicked:(id)sender
{
    NSString* apiKey = _apiKeyTextField.text;
    ResponseSuccessBlock success = ^(AFHTTPRequestOperation *operation, id responseObject){
        TyLogDebug(@"Success Response: %@", responseObject);
        XujcUser *user = [[XujcUser alloc] initWithJSONResopnse:responseObject];
        TyLogDebug(@"User Infomation: %@", [user description]);
        DYNAMIC_DATA.APIKey = apiKey;
        DYNAMIC_DATA.user = user;
        [DYNAMIC_DATA flush];
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    ResponseFailureBlock failure = ^(AFHTTPRequestOperation *operation, NSError *error) {
        TyLogFatal(@"Failure:\n\tstatusCode: %ld,\n\tdetail: %@", operation.response.statusCode, error);
    };
    
    [XujcAPI userInfomation:apiKey successBlock:success failureBlock:failure];
}


@end
