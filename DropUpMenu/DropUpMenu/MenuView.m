//
//  MenuView.m
//  DropUpMenu
//
//  Created by 王刚 on 11/17/14.
//  Copyright (c) 2014 ccidnet. All rights reserved.
//

#import "MenuView.h"
#import "GWDropUpCell.h"

//static NSUInteger const defaultHeight = 44;
#define BTN_TAG_BASE_NUM 5678
#define DEFAULT_COLOR [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0]
#define DEFAULT_BG_COLOR [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0]

static CGFloat const CellHeight = 40;

@interface MenuView() <UITableViewDelegate, UITableViewDataSource>

//滑出菜单数据
@property (nonatomic, strong) NSArray *upTableItems;
//滑出列表
@property (nonatomic, strong) UITableView *itemTableView;

//选中button索引
@property (nonatomic, assign) NSUInteger selectedBottomIndex;
//滑出菜单是否隐藏
@property (nonatomic, assign) BOOL itemTableViewHidden;

@end

@implementation MenuView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = DEFAULT_BG_COLOR;
        self.selectedBottomIndex = -1;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = DEFAULT_BG_COLOR;
        self.selectedBottomIndex = -1;

    }
    return self;
}

- (void)setBottomItems:(NSArray *)bottomItems {
    _bottomItems = bottomItems;
    //移除
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    //添加
    CGFloat btnwidth = (self.frame.size.width - (bottomItems.count-1)*0.5)/bottomItems.count;
    for (int i = 0; i < bottomItems.count; i++) {
        UIButton *btn = [self btnWithTitle:bottomItems[i] leftImageName:@"bottom_btn"];
        btn.frame = CGRectMake((btnwidth + 0.5) * i, 0.5, btnwidth, CGRectGetHeight(self.frame)-0.5);
        btn.tag = BTN_TAG_BASE_NUM + i;
        [self addSubview:btn];
    }
}



- (UIButton *)btnWithTitle:(NSString *)title leftImageName:(NSString *)imageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTintColor:[UIColor lightGrayColor]];
    [btn setTintAdjustmentMode:UIViewTintAdjustmentModeAutomatic];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    btn.backgroundColor = DEFAULT_COLOR;
    
    [btn addTarget:self action:@selector(btnHandler:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (void)btnHandler:(UIButton *)sender {
    
    NSInteger ksel = sender.tag - BTN_TAG_BASE_NUM;

    if (self.selectedBottomIndex == ksel) {
        self.itemTableViewHidden = !self.itemTableViewHidden;
    } else {
        self.upTableItems = [self.delegate upMenuItemsAtBottomIndex:ksel];
        [self.itemTableView reloadData];
        [self showItemTableAtIndex:ksel];
    }
}


- (void)setItemTableViewHidden:(BOOL)itemTableViewHidden {
    itemTableViewHidden ? [self hiddenItemTable] :  [self showItemTableAtIndex:self.selectedBottomIndex];
}

//打开
- (void)showItemTableAtIndex:(NSInteger)index {
    
    CGFloat tableWidth = (self.frame.size.width - (self.bottomItems.count+1))/self.bottomItems.count;// self.segmentedControl.frame.size.width/self.menuItems.count;
    CGRect tableFrame = CGRectMake(tableWidth * index + index + 1, self.displayView.frame.size.height/* - self.frame.size.height*/, tableWidth, CellHeight * self.upTableItems.count);
    
    self.itemTableView.frame = tableFrame;
    
    
//    UITableView *displayViewTable = (UITableView *)self.displayView;
    
    
    tableFrame.origin.y = self.displayView.frame.size.height - self.frame.size.height - CellHeight * self.upTableItems.count - 70 + 64/*(displayViewTable.contentOffset.y + 64)*/;
    [UIView animateWithDuration:0.3 animations:^{
        self.itemTableView.frame = tableFrame;
    } completion:^(BOOL finished) {
        self.selectedBottomIndex = index;
        _itemTableViewHidden = NO;
    }];
}

//隐藏
- (void)hiddenItemTable {
    
    CGRect tframe = self.itemTableView.frame;
    tframe.origin.y = self.displayView.frame.size.height;// - self.frame.size.height;
    [UIView animateWithDuration:0.2 animations:^{
        self.itemTableView.frame = tframe;
    } completion:^(BOOL finished) {
        _itemTableViewHidden = YES;
    }];
}




#pragma up tableView

- (UITableView *)itemTableView {
    if (!_itemTableView) {
        _itemTableView = [[UITableView alloc]init];
        [_itemTableView registerClass:[GWDropUpCell class] forCellReuseIdentifier:NSStringFromClass([GWDropUpCell class])];
        _itemTableView.dataSource = self;
        _itemTableView.delegate = self;
        
        _itemTableView.layer.cornerRadius = 6;
        _itemTableView.layer.borderWidth = 0.5;
        _itemTableView.layer.borderColor = DEFAULT_BG_COLOR.CGColor;
        
        _itemTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 15);
        
        if (self.displayView) {
            [self.displayView addSubview:_itemTableView];
            [self.displayView bringSubviewToFront:self];
        }
    }
    return _itemTableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.upTableItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GWDropUpCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GWDropUpCell class]) forIndexPath:indexPath];
    
    cell.nameLabel.text = self.upTableItems[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self hiddenItemTable];
    [self.delegate selectedUpMenuItemAtIndex:indexPath.row bottomIndex:self.selectedBottomIndex];
}





@end
