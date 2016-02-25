//
//  XujcScore.m
//  XujcClient
//
//  Created by 田奕焰 on 16/2/26.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import "XujcScore.h"

@implementation XujcScore

- (instancetype)initWithJSONResopnse:(NSDictionary *)json
{
    if (self = [super init]) {
        _courseName = [self checkForNull:json[kResponseCourseName]];
        _credit = [[self checkForNull:json[kResponseCredit]] integerValue];
        _score = [[self checkForNull:json[kResponseCourseSorce]] integerValue];
        _scoreLevel = [self checkForNull:json[kResponseCourseSorceLevel]];
        _midTermStatus = [self checkForNull:json[kResponseMidTermStatus]];
        _endTermStatus = [self checkForNull:json[kResponseEndTermStatus]];
        _studyWay = [self checkForNull:json[kResponseScoreStudyWay]];
    }
    return self;
}

- (NSString *)description
{
    NSMutableString *description = [[super description] mutableCopy];
    [description appendFormat:@"{\n"];
    [description appendFormat:@"\n\tcourseName: %@", _courseName];
    [description appendFormat:@"\n\tcredit: %d", _credit];
    [description appendFormat:@"\n\tscore: %d", _score];
    [description appendFormat:@"\n\tscoreLevel: %@", _scoreLevel];
    [description appendFormat:@"\n\tmidTermStatus: %@", _midTermStatus];
    [description appendFormat:@"\n\tendTermStatus: %@", _endTermStatus];
    [description appendFormat:@"\n\tstudyWay: %@", _studyWay];
    [description appendFormat:@"\n}"];
    return description;
}

@end
