//
//  LeftMenu.m
//  SideSlip
//
//  Created by Zin_戦 on 16/6/28.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#define  ImageViewWidth 18
#define  Frame_Width    self.frame.size.width//200

#import "LeftMenu.h"

@interface LeftMenu()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *contentTableView;
@end

@implementation LeftMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    
    return self;
}


- (void)initView{

    //添加头部
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Frame_Width, 90)];
    [headView setBackgroundColor:[UIColor colorWithRed:90/255.0 green:160/255.0 blue:234/255.0 alpha:1.0]];
    CGFloat width          = 90/2;
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(12, (90 - width) / 2, width, width)];
    imageview.layer.cornerRadius = imageview.frame.size.width / 2;
    imageview.layer.masksToBounds = YES;
    [imageview setImage:[UIImage imageNamed:@"HeadIcon"]];
    [headView addSubview:imageview];
    
    width                  = 15;
//    UIImageView *arrow     = [[UIImageView alloc]initWithFrame:CGRectMake(Frame_Width - width - 10, (90 - width)/2, width, width)];
//    arrow.contentMode      = UIViewContentModeScaleAspectFit;
//    [arrow setImage:[UIImage imageNamed:@"person-icon0"]];
//    [headView addSubview:arrow];
    UIButton *arrow = [[UIButton alloc] initWithFrame:CGRectMake(Frame_Width - width - 10, (90 - width)/2, width, width)];
    [arrow setImage:[UIImage imageNamed:@"person-icon0"] forState:UIControlStateNormal];
    [arrow addTarget:self action:@selector(arrowClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:arrow];
    
    UILabel *NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageview.frame.size.width + imageview.frame.origin.x * 2, imageview.frame.origin.y, 90, imageview.frame.size.height)];
    [NameLabel setText:@"麻辣隔壁"];
    NameLabel.textColor = [UIColor whiteColor];
    [headView addSubview:NameLabel];
    
    [self addSubview:headView];
    
    //中间tableview
    UITableView *contentTableView        = [[UITableView alloc]initWithFrame:CGRectMake(0, headView.frame.size.height, Frame_Width, self.frame.size.height - headView.frame.size.height * 2)
                                                                       style:UITableViewStylePlain];
    [contentTableView setBackgroundColor:[UIColor whiteColor]];
    contentTableView.dataSource          = self;
    contentTableView.delegate            = self;
    contentTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [contentTableView setBackgroundColor:[UIColor whiteColor]];
    contentTableView.separatorStyle      = UITableViewCellSeparatorStyleNone;
    contentTableView.tableFooterView = [UIView new];
    self.contentTableView = contentTableView;
    [self addSubview:contentTableView];
    
    //添加尾部
    width              = 90;
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - headView.frame.size.height, Frame_Width, self.frame.size.height)];
    [footerView setBackgroundColor:[UIColor colorWithRed:90/255.0 green:160/255.0 blue:234/255.0 alpha:1.0]];
    
    UIImageView *LoginImageview = [[UIImageView alloc]initWithFrame:CGRectMake(8 + 5, (width - ImageViewWidth)/2, ImageViewWidth, ImageViewWidth)];
    [LoginImageview setImage:[UIImage imageNamed:@"person-icon8"]];
    [footerView addSubview:LoginImageview];
    width = 30;
    
    
    [self addSubview:footerView];
}

#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = [NSString stringWithFormat:@"LeftView%li",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    [cell setBackgroundColor:[UIColor whiteColor]];
    [cell.textLabel setTextColor:[UIColor grayColor]];
    
    //    [cell setCellModel:nil indexPath:indexPath];
    //    [cell setBackgroundColor:[UIColor colorWithHexString:ColorBackGround]];
    cell.hidden = NO;
    switch (indexPath.row) {
        case 0:
        {
            [cell.imageView setImage:[UIImage imageNamed:@"person-icon1"]];
            [cell.textLabel setText:@"战国七雄"];
        }
            break;
            
        case 1:
        {
            
            [cell.imageView setImage:[UIImage imageNamed:@"person-icon2"]];
            [cell.textLabel setText:@"桃园结义"];
        }
            break;
            
            
        case 2:
        {
            
            [cell.imageView setImage:[UIImage imageNamed:@"person-icon4"]];
            [cell.textLabel setText:@"武神子龙"];
        }
            break;
            
        case 3:
        {
            
            [cell.imageView setImage:[UIImage imageNamed:@"person-icon5"]];
            [cell.textLabel setText:@"飞将奉先"];
        }
            break;
       
        case 4:{
            
            [cell.imageView setImage:[UIImage imageNamed:@"person-icon10"]];
            [cell.textLabel setText:@"三英战吕布"];
        }
            break;
            
            
        case 5:
        {
            
            [cell.imageView setImage:[UIImage imageNamed:@"person-icon7"]];
            [cell.textLabel setText:@"设置"];
        }
            break;
            
            
        default:
            break;
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.cunstomDelegate respondsToSelector:@selector(LeftMenuViewClick:)]) {
        [self.cunstomDelegate LeftMenuViewClick:indexPath.row];
    }
}

- (void)arrowClickEvent
{
    if ([self.cunstomDelegate respondsToSelector:@selector(arrowClick)]) {
        [self.cunstomDelegate arrowClick];
    }
}
@end
