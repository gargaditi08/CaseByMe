//
//  ViewController.m
//  CaseByeMe
//
//  Created by Dextrotech on 07/05/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Notifications";
    
    UIImageView *Image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
    Image.image = [UIImage imageNamed:@"screen.png"];
    [self.view addSubview:Image];
   
    UIButton *mybutton = [[UIButton alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height-60,self.view.frame.size.width-40, 40)];
    [mybutton setTitle:@"Confirmation" forState:UIControlStateNormal];
    [mybutton addTarget:self action:@selector(getImage:) forControlEvents:UIControlEventTouchUpInside];
    mybutton.backgroundColor = [UIColor redColor];
    [mybutton setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
    [self.view addSubview:mybutton];

}

-(void)getImage:(id)sender
{
    PageViewController *PageController = [[PageViewController alloc]init];
    [self.navigationController pushViewController:PageController animated:NO];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
