//
//  PersonalViewModel.h
//  XujcClient
//
//  Created by 田奕焰 on 16/3/17.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonalHeaderViewModel.h"
#import "SettingsViewModel.h"
#import "TableViewCellViewModel.h"

@interface PersonalViewModel : NSObject

- (PersonalHeaderViewModel *)personalHeaderViewModel;

- (SettingsViewModel *)settingsViewModel;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (TableViewCellViewModel *)tableViewCellViewModelForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
