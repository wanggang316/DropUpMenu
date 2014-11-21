//
//  MenuView.h
//  DropUpMenu
//
//  Created by 王刚 on 11/17/14.
//  Copyright (c) 2014 ccidnet. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuViewDelegate;

@interface MenuView : UIView

//custom methods

@property (nonatomic, weak) id<MenuViewDelegate> delegate;

//主菜单数据
@property (nonatomic, strong) NSArray *bottomItems;
//显示视图
@property (nonatomic, strong) UIView *displayView;

//隐藏滑出菜单
- (void)hiddenItemTable;


@end


@protocol MenuViewDelegate <NSObject>

- (NSArray *)upMenuItemsAtBottomIndex:(NSInteger)index;

- (void)selectedUpMenuItemAtIndex:(NSInteger)upItemIndex bottomIndex:(NSInteger)bottomIndex;

@end
