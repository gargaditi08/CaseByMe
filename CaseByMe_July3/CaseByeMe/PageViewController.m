//
//  PageViewController.m
//  CaseByeMe
//
//  Created by Dextrotech on 07/05/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import "PageViewController.h"
#import "ViewController.h"
#import "Constant.h"

#import "PhoneBGViewController.h"
@interface PageViewController ()<UIScrollViewDelegate>
{
    NSTimer *slideTimer;
    UIScrollView *scrollBG;
    NSInteger xCord;
    UIPageControl *slidePageControl;
}
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *bImage = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bImage.image = [UIImage imageNamed:@"bg.png"];
    [self.view addSubview:bImage];
    xCord=0;
    self.navigationItem.hidesBackButton = YES;
    
    
//       UIBarButtonItem *Next = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(GoNext:)];
//    //[Next setBackgroundImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    self.navigationItem.leftBarButtonItem = Next;
  
    
//    UIImageView* animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height/2)];
//    animatedImageView.animationImages = [NSArray arrayWithObjects:
//                                         [UIImage imageNamed:@"slid1.png"],
//                                         [UIImage imageNamed:@"8.png"],
//                                         [UIImage imageNamed:@"slid1.png"],
//                                         [UIImage imageNamed:@"slid1.png"], nil];
//    animatedImageView.animationDuration = 1.0f;
//    animatedImageView.animationRepeatCount = 0;
//    [animatedImageView startAnimating];
//    [self.view addSubview: animatedImageView];
    

    scrollBG = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), self.view.frame.size.height/2)];
    scrollBG.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scrollBG];
    scrollBG.pagingEnabled = YES;
    NSArray *arrImageName = [NSArray arrayWithObjects:@"slid1-1main.png",@"slid2.main.png",@"slid3-1main.png", nil];
    
    NSInteger xPos = 0;
    for (int i = 0; i<arrImageName.count; i++)
    {
        UIImageView *imgSlide = [[UIImageView alloc] initWithFrame:CGRectMake(xPos, 0, scrollBG.frame.size.width, scrollBG.frame.size.height)];
        imgSlide.image = [UIImage imageNamed:[arrImageName objectAtIndex:i]];
        [scrollBG addSubview:imgSlide];
        
        xPos+=scrollBG.frame.size.width;
    }

    
    scrollBG.contentSize = CGSizeMake(scrollBG.frame.size.width*3, scrollBG.frame.size.height);
    scrollBG.delegate=self;
    
    slideTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showSlideView)  userInfo:nil repeats:YES];
    CGFloat yPos;
    if (IS_IPHONE_4)
    {
        yPos = self.view.frame.size.height-130;
    }
    else if (IS_IPHONE_5)
    {
        yPos = self.view.frame.size.height-150;
    }
    else
    {
        yPos = self.view.frame.size.height-180;
    }
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, yPos, self.view.frame.size.width-100, 50)];
    [self.view addSubview: button];
    [button setImage:[UIImage imageNamed:@"make_case.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(Selectnext:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    slidePageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((scrollBG.frame.size.width/2)-50, (self.view.frame.size.height/2)+80, 100, 40)];
    slidePageControl.numberOfPages = 3;
    slidePageControl.currentPage = 0;
    [self.view addSubview:slidePageControl];
        
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width = scrollBG.frame.size.width;
    float fraction = scrollBG.contentOffset.x/width;
    NSInteger page = lround(fraction);
    slidePageControl.currentPage = page;
    
    
}

-(void)showSlideView
{
    if(xCord == scrollBG.frame.size.width*2){
        xCord = -scrollBG.frame.size.width;
    }
    xCord += scrollBG.frame.size.width;
    [scrollBG setContentOffset:CGPointMake(xCord, 0) animated:YES];
}

//-(void)GoNext:(UIButton *)sendar
//{
//    
//    
//    [self.navigationController popViewControllerAnimated:YES];
//        
//}
-(void)Selectnext:(id)sender
{
    PhoneBGViewController *PBC = [[PhoneBGViewController alloc]init];
    [self.navigationController pushViewController:PBC animated:YES];
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
