//
//  LeftMenu.h
//  SideSlip
//
//  Created by Zin_戦 on 16/6/28.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HomeMenuViewDelegate <NSObject>

- (void)LeftMenuViewClick:(NSInteger)index;
- (void)arrowClick;
@end

@interface LeftMenu : UIView

@property (nonatomic,weak)id <HomeMenuViewDelegate> cunstomDelegate;

@end
