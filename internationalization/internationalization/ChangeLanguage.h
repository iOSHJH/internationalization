//
//  ChangeLanguage.h
//  bpTest
//
//  Created by Jone on 2020/5/10.
//  Copyright © 2020 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChangeLanguage:NSObject

#define FGGetStringWithKeyFromTable(key, tbl) [[ChangeLanguage sharedInstance] getStringForKey:key withTable:tbl]

@property(nonatomic,strong)NSString * language;

+(id)sharedInstance;

/**
*  返回table中指定的key的值
*
 *  @param key key
*  @param table table
*
*  @return 返回table中指定的key的值
*/
-(NSString *)getStringForKey:(NSString *)key withTable:(NSString *)table;

/**
*  改变当前语言
*/
-(void)changeNowLanguage;

/**
*  设置新的语言
*
*  @param language 新语言
*/
-(void)setNewLanguage:(NSString *)language;

@end

