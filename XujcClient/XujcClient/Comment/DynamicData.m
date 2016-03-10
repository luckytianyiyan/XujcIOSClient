/**
 * @file DynamicData.m
 *
 * @author luckytianyiyan@gmail.com
 * @date 15/10/31
 * @copyright   Copyright © 2015年 luckytianyiyan. All rights reserved.
 */

#import "DynamicData.h"
#import "XujcTerm.h"
static NSString* const kDataXujcUser = @"User";

@implementation DynamicData

+ (instancetype)instance
{
    static DynamicData *shareDynamicDataInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareDynamicDataInstance = [[self alloc] init];
    });
    return shareDynamicDataInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self){
        [self loadingSettings];
    }
    return self;
}

#pragma mark - Load And Flush

- (void)loadingSettings
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    _user = [NSKeyedUnarchiver unarchiveObjectWithData:[userDefaults objectForKey:kDataXujcUser]];
    TyLogDebug(@"DynamicData Loaded:%@", [self description]);
}

- (void)flush
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[_user data] forKey:kDataXujcUser];
    
    TyLogDebug(@"DynamicData Flush:%@", [self description]);
    
    [userDefaults synchronize];
}

- (void)clear
{
    UserModel *user = [[UserModel alloc] init];
    _user = user;
    [self flush];
}

#pragma mark - Getter

- (NSString *)apiKey
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:kUserDefaultsKeyApiKey];
}

- (NSString *)xujcKey
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:kUserDefaultsKeyXujcKey];
}

- (NSArray *)terms
{
    NSArray *termDataArray = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsKeyXujcTerms];
    NSMutableArray *termArray = [NSMutableArray arrayWithCapacity:termDataArray.count];
    for (NSData *data in termDataArray) {
        XujcTerm *term = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [termArray addObject:term];
    }
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"termId" ascending:YES];
    return [termArray sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
}

#pragma mark - Other

- (NSString *)description
{
    return [NSString stringWithFormat:@"{\n\tAPIKey: %@, \n\tXujcKey: %@, \n\tUser: %@\n}", self.apiKey, self.xujcKey, [_user description]];
}

@end
