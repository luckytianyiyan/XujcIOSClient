//
//  MainTabBarViewModel.h
//  XujcClient
//
//  Created by 田奕焰 on 16/3/8.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScheduleViewModel.h"
#import "LoginViewModel.h"
#import "SignupViewModel.h"
#import "ScoreViewModel.h"

@interface MainTabBarViewModel : NSObject


- (LoginViewModel *)loginViewModel;

- (SignupViewModel *)signupViewModel;

- (ScoreViewModel *)scoreViewModel;

- (ScheduleViewModel *)scheduleViewModel;

- (BindingAccountViewModel *)bindingAccountViewModel;

@end
