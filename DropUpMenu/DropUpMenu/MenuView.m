//
//  MenuView.m
//  DropUpMenu
//
//  Created by 王刚 on 11/17/14.
//  Copyright (c) 2014 ccidnet. All rights reserved.
//

#import "MenuView.h"

//static NSUInteger const defaultHeight = 44;
#define DEFAULT_COLOR [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0];
#define DEFAULT_BG_COLOR [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0];

@interface MenuView()

@property (nonatomic, strong) NSMutableArray *inner_items;

@end

@implementation MenuView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = DEFAULT_BG_COLOR;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = DEFAULT_BG_COLOR;

    }
    return self;
}


- (void)setTitles:(NSArray *)titles images:(NSArray *)images {
    
    CGFloat btnwidth = (self.frame.size.width - (titles.count-1)*0.5)/titles.count;
    
    for (int i = 0; i < titles.count; i++) {
        UIButton *btn = [self btnWithTitle:titles[i] leftImageName:images[i]];
        btn.frame = CGRectMake((btnwidth + 0.5) * i, 0.5, btnwidth, CGRectGetHeight(self.frame)-0.5);
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
    
    return btn;
}


@end
