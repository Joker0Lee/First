//
//  MainTabViewController.m
//  TabViewHeader
//
//  Created by Apple on 16/5/9.
//  Copyright © 2016年 oubuy·luo. All rights reserved.
// 我相信这应该是最简单的代码了吧😄

#define HeadImgHeight 180
#define Width [UIScreen mainScreen].bounds.size.width

#import "MainTabViewController.h"

@interface MainTabViewController ()

@property (strong, nonatomic) UIImageView *HeadImgView; //!< 头部图像
@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.HeadImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Width, HeadImgHeight)];
    self.HeadImgView.image = [UIImage imageNamed:@"eee"];
    
    [self.tableView addSubview:self.HeadImgView];
    
    // 与图像高度一样防止数据被遮挡
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, HeadImgHeight)];
    NSLog(@"hgggggfddsadf");
}

/**
 *  重写这个代理方法就行了，利用contentOffset这个属性改变frame
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY < 0) {
        self.HeadImgView.frame = CGRectMake(offsetY/2, offsetY, Width - offsetY, HeadImgHeight - offsetY);  // 修改头部的frame值就行了
    }
    
    /* 往上滑动contentOffset值为正，大多数都是监听这个值来做一些事 */
}


#warning 下面代码不用看,tableView的基本代码

#pragma mark
#pragma mark - TableViewCell 代理方法
// 每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 18;
}

// cell定制
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%d行",(int)indexPath.row];
    return cell;
}

// 选中每一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
