//
//  LessonTimeCalculator.m
//  XujcClient
//
//  Created by 田奕焰 on 16/3/11.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import "LessonTimeCalculator.h"
#import "NSDate+Week.h"

@interface LessonTimeCalculator()

@property (strong, nonatomic) NSCalendar *calendar;

@end

@implementation LessonTimeCalculator

+ (instancetype)instance
{
    static LessonTimeCalculator *shareLessonTimeCalculatorInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareLessonTimeCalculatorInstance = [[self alloc] init];
    });
    return shareLessonTimeCalculatorInstance;
}

- (instancetype)init
{
    if (self = [super init]) {
        _calendar = [NSCalendar currentCalendar];
    }
    return self;
}

+ (NSInteger)earliestLessonNumber
{
    return 1;
}

+ (NSInteger)lastLessonNumber
{
    return 12;
}

+ (NSTimeInterval)lessonDuration
{
    return 45 * kTimeIntervalOfMinute;
}

- (NSDate *)firstLessonStartTime
{
    NSDateComponents *components = [_calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:[NSDate date]];
    components.hour = 8;
    components.minute = 0;
    return [_calendar dateFromComponents:components];
}

- (NSDate *)firstLessonStartTimeOfDay:(NSDate *)dayDate
{
    NSDateComponents *components = [_calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:dayDate];
    components.hour = 8;
    components.minute = 0;
    return [_calendar dateFromComponents:components];
}

- (NSTimeInterval)timeIntervalRelativeToFirstLessonStartTime:(NSInteger)lessonNumber
{
    NSTimeInterval interval;
    if (lessonNumber == 1){
        interval = 0;
    } else if (lessonNumber == 2) {
        interval = kTimeIntervalOfMinute * 55;
    } else if (lessonNumber == 3) {
        interval = kTimeIntervalOfHour * 2;
    } else if (lessonNumber == 4) {
        interval = kTimeIntervalOfHour * 2 + kTimeIntervalOfMinute * 55;
    } else if (lessonNumber == 51) {
        interval = kTimeIntervalOfHour * 4 + kTimeIntervalOfMinute * 30;
    } else if (lessonNumber == 52) {
        interval = kTimeIntervalOfHour * 5 + kTimeIntervalOfMinute * 25;
    } else if (lessonNumber == 5) {
        interval = kTimeIntervalOfHour * 6 + kTimeIntervalOfMinute * 30;
    } else if (lessonNumber == 6) {
        interval = kTimeIntervalOfHour * 7 + kTimeIntervalOfMinute * 25;
    } else if (lessonNumber == 7) {
        interval = kTimeIntervalOfHour * 8 + kTimeIntervalOfMinute * 30;
    } else if (lessonNumber == 8) {
        interval = kTimeIntervalOfHour * 9 + kTimeIntervalOfMinute * 25;
    } else if (lessonNumber == 9) {
        interval = kTimeIntervalOfHour * 11 + kTimeIntervalOfMinute * 30;
    } else if (lessonNumber == 10) {
        interval = kTimeIntervalOfHour * 12 + kTimeIntervalOfMinute * 25;
    }
    return interval;
}

- (NSInteger)currentLessonNumberByTime:(NSDate *)date
{
    NSInteger currentLessonNumber = 0;
    NSDateComponents *components = [_calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date];
    NSTimeInterval timeIntervalRelativeToFirstLessonStartTime = (components.hour - 8) * kTimeIntervalOfHour + components.minute * kTimeIntervalOfMinute;
    for (NSInteger i = [LessonTimeCalculator earliestLessonNumber]; i < [LessonTimeCalculator lastLessonNumber]; ++i) {
        NSTimeInterval interval = [self timeIntervalRelativeToFirstLessonStartTime:i] + [LessonTimeCalculator lessonDuration];
        if (timeIntervalRelativeToFirstLessonStartTime < interval) {
            currentLessonNumber = i;
            break;
        }
    }
    return currentLessonNumber;
}

- (CGFloat)lessonProgress:(NSDate *)currentDate
{
    NSInteger currentLessonNumber = 0;
    CGFloat currentLessProgress = 0;
    NSDateComponents *components = [_calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:currentDate];
    NSTimeInterval timeIntervalRelativeToFirstLessonStartTime = (components.hour - 8) * kTimeIntervalOfHour + components.minute * kTimeIntervalOfMinute;
    
    NSTimeInterval lessonDuration = [LessonTimeCalculator lessonDuration];
    for (NSInteger i = [LessonTimeCalculator earliestLessonNumber]; i < [LessonTimeCalculator lastLessonNumber]; ++i) {
        NSTimeInterval interval = [self timeIntervalRelativeToFirstLessonStartTime:i] + lessonDuration;
        if (timeIntervalRelativeToFirstLessonStartTime < interval) {
            currentLessonNumber = i;
            currentLessProgress = MAX(1 - (interval - timeIntervalRelativeToFirstLessonStartTime) / lessonDuration, 0.f);
            break;
        }
    }
    return currentLessonNumber - 1 + currentLessProgress;
}

@end
