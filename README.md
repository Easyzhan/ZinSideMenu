# ZinSideMenu
###这是一个我认为入侵性相当低，相当无公害好用的类型，所以写出来留备用。
###效果图来一发吧
![big king](https://github.com/Easyzhan/ZinSideMenu/blob/master/circleCount.gif)

##使用方式
    1.拖拽SlipMenu文件夹到项目中
    2.在主VC中，导入
    #import "MenuView.h" 
    #import "LeftMenu.h"
    3.控制器遵守协议<HomeMenuViewDelegate>
    4.@property (nonatomic,strong) MenuView  *menu;
    5.
        LeftMenu *leftView = [[LeftMenu alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width * 0.8, [[UIScreen mainScreen] bounds].size.height)];
       leftView.cunstomDelegate = self;
        MenuView *menu = [MenuView MenuViewWithDependencyView:self.view MenuView:leftView isShowCoverView:YES];
        self.menu = menu;
    #pragma -mark 自定义的代理方法
    - (void) LeftMenuViewClick:(NSInteger)index
    {
        [self.menu hidenWithAnimation];
        NSLog(@"----点击了第%ld个",(long)index);
    }

    - (void)arrowClick
    {
       NSLog(@"arrow was click!!");
    }
