//
//  MenuItem.m
//  DropUpMenu
//
//  Created by 王刚 on 11/17/14.
//  Copyright (c) 2014 ccidnet. All rights reserved.
//

#import "MenuItem.h"

@interface MenuItem()

@property (nonatomic, strong) UIImageView *leftImageView;

@end

@implementation MenuItem

- (instancetype)initWithTitle:(NSString *)title leftImageName:(NSString *)imageName {
    self = [super init];
    if (self) {
        self.title = title;
        self.imageName = imageName;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.title = @"";
        
    }
    return self;
}

- (void)setImageName:(NSString *)imageName {
    self.leftImageView.image = [UIImage imageNamed:imageName];
    [self addSubview:self.leftImageView];
}

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
    }
    return _leftImageView;
}

@end
