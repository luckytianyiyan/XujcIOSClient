//
//  ScheduleViewModel.h
//  XujcClient
//
//  Created by 田奕焰 on 16/3/8.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import "RequestViewModel.h"

@interface ScheduleViewModel : RequestViewModel

@property (strong, nonatomic) NSArray *courseEvents;

@property (strong, nonatomic) RACSignal *fetchScheduleCourseSignal;

@property (strong, nonatomic) RACSignal *fetchTermsSignal;

@end
