/**
 * @file DynamicData.h
 *
 * @author luckytianyiyan@gmail.com
 * @date 15/10/31
 * @copyright   Copyright © 2015年 luckytianyiyan. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "UserModel.h"

#define DYNAMIC_DATA [DynamicData instance]

@interface DynamicData : NSObject

+ (instancetype)instance;

- (instancetype)init;

- (void)loadingSettings;

- (void)flush;
/**
 *  @brief  清除所有数据
 */
- (void)clear;

@property(nonatomic, copy) NSString *APIKey;
@property(nonatomic, strong) UserModel *user;
/**
 *  @brief  学期数组
 *  @note   它总是有序的, setter 会自动排序
 */
@property(nonatomic, copy) NSArray *terms;

@end
