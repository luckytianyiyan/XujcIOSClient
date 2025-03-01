//
//  PersonalHeaderViewModel.h
//  XujcClient
//
//  Created by 田奕焰 on 16/3/17.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EditableAvatarImageViewModel;

@interface PersonalHeaderViewModel : NSObject

@property (copy, readonly, nonatomic) NSString *nickname;

@property (copy, readonly, nonatomic) NSString *avatar;

- (EditableAvatarImageViewModel *)editableAvatarImageViewModel;

@end
