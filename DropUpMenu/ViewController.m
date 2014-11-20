//
//  ViewController.m
//  DropUpMenu
//
//  Created by 王刚 on 11/17/14.
//  Copyright (c) 2014 ccidnet. All rights reserved.
//

#import "ViewController.h"
#import "MenuView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MenuView *menuView = [[MenuView alloc]init];
    menuView.frame = CGRectMake(0, 200, 320, 44);
    [self.view addSubview:menuView];
    
//    [self addToolbar];
}

-(void)addToolbar
{
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                  target:nil action:nil];
    spaceItem.width = 5;
    
    UIBarButtonItem *customItem1 = [[UIBarButtonItem alloc]initWithTitle:@"精品" style:UIBarButtonItemStylePlain
                                    target:self action:@selector(barButtonItemHandler:)];
    UIBarButtonItem *customItem2 = [[UIBarButtonItem alloc]
                                    initWithTitle:@"工业" style:UIBarButtonItemStylePlain
                                    target:self action:@selector(barButtonItemHandler:)];
    UIBarButtonItem *customItem3 = [[UIBarButtonItem alloc]
                                    initWithTitle:@"信息化" style:UIBarButtonItemStylePlain
                                    target:self action:@selector(barButtonItemHandler:)];
    
    customItem1.width = 100;
    customItem2.width = 100;
    customItem3.width = 100;
    customItem1.tintColor = [UIColor darkGrayColor];
    customItem2.tintColor = [UIColor darkGrayColor];
    customItem3.tintColor = [UIColor darkGrayColor];
    
    spaceItem.tintColor = [UIColor blackColor];
    
    NSArray *toolbarItems = [NSArray arrayWithObjects:spaceItem,
                             customItem1,spaceItem, customItem2,spaceItem, customItem3, nil];

    
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 366+54, 320, 44)];
    toolbar.backgroundColor = [UIColor brownColor];
    [toolbar setBarStyle:UIBarStyleDefault];
    [self.view addSubview:toolbar];
    [toolbar setItems:toolbarItems];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    label.backgroundColor = [UIColor redColor];
    
    [toolbar addSubview: label];
}


- (void)barButtonItemHandler:(id)sender {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
