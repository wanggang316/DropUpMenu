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

//override methods
- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;
- (UIColor *)backgroundColor;

//custom methods
@property (nonatomic, copy) NSArray *items;

@property (nonatomic, weak) id<MenuViewDelegate> delegate;

@end


@protocol MenuViewDelegate <NSObject>


@end
