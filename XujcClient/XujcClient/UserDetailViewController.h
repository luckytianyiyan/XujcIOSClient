//
//  UserDetailViewController.h
//  XujcClient
//
//  Created by 田奕焰 on 16/3/24.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserDetailViewModel;

@interface UserDetailViewController : UIViewController

- (instancetype)initWithViewModel:(UserDetailViewModel *)viewModel;

@end
