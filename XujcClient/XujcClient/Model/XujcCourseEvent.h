/**
 * @file XujcCourseEvent.h
 *
 * @author luckytianyiyan@gmail.com
 * @date 15/11/2
 * @copyright   Copyright © 2015年 luckytianyiyan. All rights reserved.
 */

#import "BaseModel.h"

@interface XujcCourseEvent : BaseModel

@property(nonatomic, copy) NSString *courseClassId;
@property(nonatomic, copy) NSString *eventDescription;
/**
 *  @brief  周几
 */
@property(nonatomic, copy) NSString *studyDay;
/**
 *  @brief  上课周间隔
 */
@property(nonatomic, copy) NSString *weekInterval;

@property(nonatomic, assign) NSInteger startTime;
@property(nonatomic, assign) NSInteger endTime;

@property(nonatomic, assign) NSInteger startWeek;
@property(nonatomic, assign) NSInteger endWeek;

@property(nonatomic, copy) NSString *location;

@end
