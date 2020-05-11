//
//  ChangeLanguage.m
//  bpTest
//
//  Created by Jone on 2020/5/10.
//  Copyright © 2020 Jone. All rights reserved.
//

#import"ChangeLanguage.h"

#import"AppDelegate.h"

#define CNS @"zh-Hans"

#define EN @"en"

#define LANGUAGE_SET @"langeuageset"

@interface ChangeLanguage()

@property(nonatomic,strong)NSBundle * bundle;

@end

@implementation ChangeLanguage

static ChangeLanguage * sharedModel;

+(id)sharedInstance{
    if(!sharedModel){
        sharedModel=[[ChangeLanguage alloc]init];
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
    if([tmp isEqualToString:CNS]||!tmp){
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

@end

