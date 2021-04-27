//
//  ChangeLanguage.m
//  bpTest
//
//  Created by Jone on 2020/5/10.
//  Copyright © 2020 Jone. All rights reserved.
//

#import"LanguageManage.h"

#import"AppDelegate.h"

#define CNS @"zh-Hans"

#define EN @"en"

#define LANGUAGE_SET @"langeuageset"

@interface LanguageManage()

@property(nonatomic,strong)NSBundle * bundle;

@end

@implementation LanguageManage

static LanguageManage * sharedModel;

+(id)sharedInstance{
    if(!sharedModel){
        sharedModel=[[LanguageManage alloc]init];
    }
    return sharedModel;
}

-(instancetype)init{
    self=[super init];
    if(self){
        [self initLanguage];
    }
    return self;
}

-(void)initLanguage{
    NSString*tmp=[[NSUserDefaults standardUserDefaults]objectForKey:LANGUAGE_SET];
    NSString*path;
    //默认是中文
    if([tmp isEqualToString:CNS] || !tmp){
        tmp=CNS;
    }else{
        tmp=EN;
    }
    self.language=tmp;//更改之前语言
    path=[[NSBundle mainBundle]pathForResource:self.language ofType:@"lproj"];
    self.bundle=[NSBundle bundleWithPath:path];
}

-(NSString*)getStringForKey:(NSString*)key withTable:(NSString*)table{
    if(self.bundle){
        return NSLocalizedStringFromTableInBundle(key,table,self.bundle,@"");
    }
    return NSLocalizedStringFromTable(key,table,@"");
}

-(void)changeNowLanguage{
    if([self.language isEqualToString:EN]){
        [self setNewLanguage:CNS];
    }else{
        [self setNewLanguage:EN];
    }
}

-(void)setNewLanguage:(NSString*)language{
    if([language isEqualToString:self.language]){
        return;
    }
    //找到需要改成的语言路径
    if([language isEqualToString:EN]||[language isEqualToString:CNS]){
        NSString*path=[[NSBundle mainBundle]pathForResource:language ofType:@"lproj"];
        self.bundle=[NSBundle bundleWithPath:path];
    }
    self.language=language;NSLog(@"%@",language);
    [[NSUserDefaults standardUserDefaults]setObject:language forKey:LANGUAGE_SET];
    [[NSUserDefaults standardUserDefaults]synchronize];
//    [self resetRootViewController];
}

//重新设置
-(void)resetRootViewController{
    AppDelegate * appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    UIStoryboard * SB=[UIStoryboard storyboardWithName:@"Main"bundle:nil];
    UITabBarController * tabBarController=[SB instantiateViewControllerWithIdentifier:@"tabBarController"];
    tabBarController=(UITabBarController *)appDelegate.window.rootViewController;
}

/// 获取当前设备语言
+ (NSString *)getCurrentLanguage {
    NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    NSString *languageName = [appLanguages objectAtIndex:0];
    NSLog(@"当前设备语言：%@", languageName);
    return languageName;
}

@end

