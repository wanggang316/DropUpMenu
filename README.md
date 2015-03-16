DropUpMenu
-----------

![screen](./screen/screen.PNG)



##使用：

	MenuView *menuView = [[MenuView alloc]init];
 	menuView.frame = CGRectMake(0, 568-44, 320, 44);
   	[menuView setBottomItems:@[@"工业", @"评论", @"信息化"]];
	menuView.displayView = self.view;
	menuView.delegate = self;
   	[self.view addSubview:menuView];
