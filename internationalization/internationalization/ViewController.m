//
//  ViewController.m
//  internationalization
//
//  Created by Jone on 2020/5/11.
//  Copyright © 2020 Jone. All rights reserved.
//

#import "ViewController.h"
#import "LanguageManage.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *yuyan;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *photoButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 跟随系统写法，就不会用到这个类 LanguageManage
    // [self.yuyan setTitle:NSLocalizedString(@"language", nil) forState:UIControlStateNormal];
    
    
    
    
//    $(PRODUCT_NAME)
    
//    [self switchYuyan:self.yuyan];
//    [[LanguageManage sharedInstance] setNewLanguage:[LanguageManage getCurrentLanguage]];
    [self setText];
    
    
}

- (IBAction)switchYuyan:(id)sender {
    [[LanguageManage sharedInstance] changeNowLanguage];
    [self setText];
}

- (IBAction)photoAction:(id)sender {
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:ipc animated:YES completion:nil];
}

- (void)setText {
    // language.strings
    [self.yuyan setTitle:FGGetStringWithKeyFromTable(@"language", @"Localizable") forState:UIControlStateNormal];
    self.accountField.placeholder = FGGetStringWithKeyFromTable(@"account", @"Localizable");
    self.passwordField.placeholder = FGGetStringWithKeyFromTable(@"password", @"Localizable");
    
    // Localizable.string
    [self.photoButton setTitle:FGGetStringWithKeyFromTable(@"jh_photo", @"language") forState:UIControlStateNormal];
    
//    [self.yuyan setTitle:NSLocalizedString(@"language", nil) forState:UIControlStateNormal];
//    self.accountField.placeholder = NSLocalizedString(@"account", nil);
//    self.passwordField.placeholder = NSLocalizedString(@"password", nil);
}

@end
