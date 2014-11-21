//
//  UpMenuView.m
//  DropUpMenu
//
//  Created by 王刚 on 11/17/14.
//  Copyright (c) 2014 ccidnet. All rights reserved.
//

#import "UpMenuView.h"
#import "GWDropUpCell.h"

static CGFloat const CellHeight = 40;   //cell行高

@interface UpMenuView() <UITableViewDataSource, UITableViewDelegate>

@end

@implementation UpMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self registerClass:[GWDropUpCell class] forCellReuseIdentifier:NSStringFromClass([GWDropUpCell class])];
        self.dataSource = self;
        self.delegate = self;
        
        self.layer.cornerRadius = 6;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0].CGColor;
        
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return self;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GWDropUpCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GWDropUpCell class]) forIndexPath:indexPath];
    
    cell.nameLabel.text = self.items[indexPath.row];
    //    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    //    cell.textLabel.font = [UIFont systemFontOfSize:13];
    //    cell.backgroundColor = UIColorFromRGB(0xfafafa);
    //    cell.backgroundColor = [UIColor purpleColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellHeight;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self hiddenItemTable];
//    
//    [self.delegate upTableView:tableView didSelectRowAtSegmentIndex:self.segmentedSelectedIndex itemIndex:indexPath.row];
//}

@end
