//
//  ViewController.m
//  internationalization
//
//  Created by Jone on 2020/5/11.
//  Copyright © 2020 Jone. All rights reserved.
//

#import "ViewController.h"
#import "ChangeLanguage.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *yuyan;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    $(PRODUCT_NAME)
    
//    [self switchYuyan:self.yuyan];
    [self setText];
}

- (IBAction)switchYuyan:(id)sender {
    [[ChangeLanguage sharedInstance] changeNowLanguage];
    [self setText];
}

- (void)setText {
    [self.yuyan setTitle:FGGetStringWithKeyFromTable(@"language", @"InfoPlist") forState:UIControlStateNormal];
    self.accountField.placeholder = FGGetStringWithKeyFromTable(@"account", @"InfoPlist");
    self.passwordField.placeholder = FGGetStringWithKeyFromTable(@"password", @"InfoPlist");
}

@end
