//
//  RotateViewController.m
//  CaseByeMe
//
//  Created by Kuldeep Saini on 22/05/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import "RotateViewController.h"
#import "ContactViewController.h"
#import "AddCardController.h"
@interface RotateViewController ()

{
    UIScrollView *scrollBG;
}
@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *Next = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(GoNext:)];
    Next.tag = 200;
    //[Next setBackgroundImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.navigationItem.rightBarButtonItem = Next;
    [Next setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal style:UIBarButtonItemStylePlain barMetrics:0];
    
    UIBarButtonItem *Back = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(GoNext:)];
     Back.tag = 201;
    [Back setBackgroundImage:[UIImage imageNamed:@"back-1.png"] forState:UIControlStateNormal style:UIBarButtonItemStylePlain barMetrics:0];
    self.navigationItem.leftBarButtonItem = Back;
    
    scrollBG = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollBG.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollBG];
    
    CGFloat xPos = 20;
    CGFloat yPos = 20;
    
    UIImageView *imgFirst = [[UIImageView alloc] initWithFrame:CGRectMake(xPos, 20, CGRectGetWidth(self.view.frame), (CGRectGetHeight(self.view.frame)/2)-60)];
   // imgFirst.image = [UIImage imageNamed:@""];
    imgFirst.backgroundColor = [UIColor clearColor];
    [scrollBG addSubview:imgFirst];
    

    
    
     UIImageView *imgTop = [[UIImageView alloc]initWithFrame:CGRectMake(30, 20,imgFirst.frame.size.width-40, imgFirst.frame.size.height)];
    [imgFirst addSubview:imgTop];
    imgTop.image = self.selectedImage;
    imgTop.contentMode = UIViewContentModeScaleAspectFit;
    imgTop.backgroundColor = [UIColor clearColor];
   //left.center = CGPointMake(100.0, 100.0);
   imgTop.transform = CGAffineTransformMakeRotation(M_PI_4);
    
    
    yPos+=imgFirst.frame.size.height+10;

    
    UIImageView *imgSecond = [[UIImageView alloc] initWithFrame:CGRectMake(xPos, yPos, CGRectGetWidth(self.view.frame), (CGRectGetHeight(self.view.frame)/2)-xPos*2)];
    imgSecond.image = [UIImage imageNamed:@""];
    imgSecond.backgroundColor = [UIColor clearColor];
    [scrollBG addSubview:imgSecond];

    UIImageView *imgBottom = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20,imgFirst.frame.size.width-40, imgFirst.frame.size.height)];
    [imgSecond addSubview:imgBottom];
    imgBottom.image = self.selectedImage;
    imgBottom.contentMode = UIViewContentModeScaleAspectFit;
    imgBottom.backgroundColor = [UIColor clearColor];
    //left.center = CGPointMake(100.0, 100.0);
    imgBottom.transform = CGAffineTransformMakeRotation(M_PI_4*3);
    

    
}
-(void)GoNext:(UIButton *)sendar
{
    if (sendar.tag==200)
    {
        AddCardController *addcards = [[AddCardController alloc]init];
        addcards.finalImage = self.selectedImage;
        [self.navigationController pushViewController:addcards animated:YES];
//        ContactViewController *contactVC = [[ContactViewController alloc]init];
//        contactVC.finalImage = self.selectedImage;
//        [self.navigationController pushViewController:contactVC animated:YES];
        
    }
    if (sendar.tag==201)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
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
