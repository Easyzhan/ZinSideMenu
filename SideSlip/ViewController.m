//
//  ViewController.m
//  SideSlip
//
//  Created by Zin_戦 on 16/6/28.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import "ViewController.h"
#import "MenuView.h"
#import "LeftMenu.h"

@interface ViewController ()<HomeMenuViewDelegate>

@property (nonatomic,strong) MenuView  *menu;

- (IBAction)LeftTopAction:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //将status bar 文本颜色设置为白色
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    self.view.backgroundColor = [UIColor redColor];
    
    LeftMenu *leftView = [[LeftMenu alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width * 0.8, [[UIScreen mainScreen] bounds].size.height)];
    leftView.cunstomDelegate = self;
    MenuView *menu = [MenuView MenuViewWithDependencyView:self.view MenuView:leftView isShowCoverView:YES];
    self.menu = menu;
}

- (void) LeftMenuViewClick:(NSInteger)index
{
    [self.menu hidenWithAnimation];
    NSLog(@"----点击了第%ld个",(long)index);
    NSString *tagstr = [NSString stringWithFormat:@"%ld",(long)index];
    [[[UIAlertView alloc] initWithTitle:@"🖥提示" message:tagstr delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
    
}

- (void)arrowClick
{
    NSLog(@"arrow was click!!");

    [[[UIAlertView alloc] initWithTitle:@"🖥提示" message:@"按钮被扒光腚了！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}
- (IBAction)LeftTopAction:(id)sender {
    [self.menu show];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
