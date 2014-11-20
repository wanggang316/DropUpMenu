//
//  MenuView.m
//  DropUpMenu
//
//  Created by 王刚 on 11/17/14.
//  Copyright (c) 2014 ccidnet. All rights reserved.
//

#import "MenuView.h"

static NSUInteger const defaultHeight = 44;
#define DEFAULT_COLOR [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0];

@implementation MenuView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = DEFAULT_COLOR;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = DEFAULT_COLOR;

    }
    return self;
}

@end
