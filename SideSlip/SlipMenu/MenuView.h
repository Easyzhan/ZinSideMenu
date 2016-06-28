//
//  MenuView.h
//  SideSlip
//
//  Created by Zin_戦 on 16/6/28.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuView : UIView

+(instancetype)MenuViewWithDependencyView:(UIView *)dependencyView MenuView:(UIView *)leftmenuView isShowCoverView:(BOOL)isCover;

-(instancetype)initWithDependencyView:(UIView *)dependencyView MenuView:(UIView *)leftmenuView isShowCoverView:(BOOL)isCover;


-(void)show;

-(void)hidenWithoutAnimation;
-(void)hidenWithAnimation;

@end
