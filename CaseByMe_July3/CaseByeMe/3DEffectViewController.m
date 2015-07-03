//
//  3DEffectViewController.m
//  CaseByeMe
//
//  Created by Kuldeep Saini on 15/05/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import "3DEffectViewController.h"

@interface _DEffectViewController ()

@end

@implementation _DEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width/2, self.view.frame.size.height/2)];
    [self.view addSubview:image1];
    image1.image = [UIImage imageNamed:@"mobile1.png"];
    
    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2,self.view.frame.size.width/2, self.view.frame.size.height/2)];
    [self.view addSubview:image2];
    image2.image = [UIImage imageNamed:@"mobile2.png"];
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
