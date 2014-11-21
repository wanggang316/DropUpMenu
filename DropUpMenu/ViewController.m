//
//  ViewController.m
//  DropUpMenu
//
//  Created by 王刚 on 11/17/14.
//  Copyright (c) 2014 ccidnet. All rights reserved.
//

#import "ViewController.h"
#import "MenuView.h"

@interface ViewController () <MenuViewDelegate>

@property (nonatomic, strong) NSArray *allUpDatas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MenuView *menuView = [[MenuView alloc]init];
    menuView.frame = CGRectMake(0, 568-44, 320, 44);
    [menuView setBottomItems:@[@"工业", @"评论", @"信息化"]];
    menuView.displayView = self.view;
    menuView.delegate = self;
    [self.view addSubview:menuView];
    
    
    NSArray *up1 = @[@"IT评论",@"产业评论",@"经济评论",@"管理评论",@"融合",@"上策",@"跨界"];
    NSArray *up2 = @[@"装备制造", @"消费品", @"原材料", @"汽车", @"节能环保", @"新能源"];
    NSArray *up3 = @[@"电子信息", @"半导体", @"通信", @"互联网", @"软件"];
    self.allUpDatas = @[up1, up2, up3];
}

#pragma mark - delegate methods
- (NSArray *)upMenuItemsAtBottomIndex:(NSInteger)index {
    return self.allUpDatas[index];
}

- (void)selectedUpMenuItemAtIndex:(NSInteger)upItemIndex bottomIndex:(NSInteger)bottomIndex {
    NSLog(@"bottom index is : %d, up index is : %d", bottomIndex, upItemIndex);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
