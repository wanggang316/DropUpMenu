//
//  MenuItem.h
//  DropUpMenu
//
//  Created by 王刚 on 11/17/14.
//  Copyright (c) 2014 ccidnet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuItem : UIButton

- (instancetype)initWithTitle:(NSString *)title leftImageName:(NSString *)imageName;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageName;
@end
