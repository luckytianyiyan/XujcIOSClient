//
//  ScheduleViewModel.h
//  XujcClient
//
//  Created by 田奕焰 on 16/3/8.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import "SemesterBaseViewModel.h"
#import "CourseEventViewModel.h"
#import "XujcLessonEventModel.h"

@interface ScheduleViewModel : SemesterBaseViewModel

/**
 *  @brief courseEvents[numberOfWeek][numberOfEvent]
 */
@property (strong, nonatomic) NSArray<NSArray<XujcLessonEventModel *> *> *courseEvents;

@property (strong, nonatomic) RACSignal *fetchScheduleCourseSignal;

- (CourseEventViewModel *)cellViewModelAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfCourseEventInSection:(NSInteger)section;

@end
