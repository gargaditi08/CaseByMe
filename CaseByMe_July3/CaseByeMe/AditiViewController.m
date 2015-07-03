//
//  AditiViewController.m
//  ProtocolSample
//
//  Created by Kuldeep Saini on 17/05/15.
//  Copyright (c) 2015 Kuldeep Saini. All rights reserved.
//

#import "AditiViewController.h"
#import "RotateViewController.h"
#import "AppDelegate.h"
#import "Constant.h"
#import "UIView+ImageRender.h"

@interface AditiViewController ()<UIGestureRecognizerDelegate>
{
    UIImageView *mainImage;
    UIImageView *mainImage1;
    UIImageView *mainImage2;
    UIScrollView *scrollImage;
    
    NSMutableArray *arrButtonImages;
    UIImageView *vwDrag;
    UIImageView *image;
    UIImageView *effectedImage;
    UIImageView *transparentImage;
    
    UIImage *finalImage;
    
    UIView *vwMainBackground;
}
@end

@implementation AditiViewController
@synthesize transSelected;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    //effectedImage = [UIImageView alloc]initWithFrame:<#(CGRect)#>
    
    UIBarButtonItem *Next = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(GoNext:)];
    Next.tag = 200;
    self.navigationItem.rightBarButtonItem = Next;
    [Next setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal style:UIBarButtonItemStylePlain barMetrics:0];
    
    UIBarButtonItem *Back = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(GoNext:)];
    Back.tag = 201;
    [Back setBackgroundImage:[UIImage imageNamed:@"back-1.png"] forState:UIControlStateNormal style:UIBarButtonItemStylePlain barMetrics:0];
    self.navigationItem.leftBarButtonItem = Back;
    
    

    [self designCollageScreen];
}
-(void)GoNext:(UIButton *)sendar
{
    
    if (sendar.tag==200)
    {
        
    CGSize size = CGSizeMake(CGRectGetWidth(self.view.frame)-140,CGRectGetHeight(self.view.frame)/2);
    UIGraphicsBeginImageContext(size);
    [mainImage1.image drawInRect:CGRectMake(0,0,size.width,size.height)];
     finalImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();

    RotateViewController *rotateVw = [[RotateViewController alloc]init];
   rotateVw.selectedImage = [vwMainBackground renderImage];
    [self.navigationController pushViewController:rotateVw animated:YES];
        
    }
    
    if (sendar.tag==201)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


-(void)designCollageScreen
{
    CGFloat xCord = 50;
    CGFloat yCord = 80;
    CGFloat width = self.view.frame.size.width - 100;
    CGFloat height = self.view.frame.size.height - 100 -yCord;
    
    
    vwMainBackground = [[UIView alloc] initWithFrame:CGRectMake(xCord, yCord, width, height)];
    vwMainBackground.backgroundColor = [UIColor clearColor];
    [self.view addSubview:vwMainBackground];
    
    
    mainImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(0 , 0, width, height)];
    mainImage1.image = self.selectedImage;
    [vwMainBackground addSubview:mainImage1];
    
    
    effectedImage = [[UIImageView alloc]initWithFrame:CGRectMake(0 , 0, width, height)];
    [vwMainBackground addSubview:effectedImage];
    
    
    transparentImage =[[UIImageView alloc]initWithFrame:CGRectMake(0 , 0, width, height)];
    transparentImage.image = transSelected;// [UIImage imageNamed:@"transphone1.png"];
    [vwMainBackground addSubview:transparentImage];
    
    
    yCord+=height;
    
    
    
    // Now create bottom SCroll view for all facebook images.
    scrollImage = [[UIScrollView alloc] initWithFrame:CGRectMake(0, yCord, CGRectGetWidth(self.view.frame), 120)];
    scrollImage.backgroundColor = [UIColor clearColor]; //lightGrayColor]colorWithAlphaComponent:(0.5)];
    [self.view addSubview:scrollImage];
    
    
    
    // Design Buttons on the scroll view
    UIImage *orignalImage = self.selectedImage;
    
    //first filter
    UIImage *fristFilter = [self imageBlackAndWhite];
    
    //second filter
    
    UIImage *secondfilter = [UIImage imageNamed:@"effect_three.png"];
        
   //third filter
    UIImage *thirdFilter = [UIImage imageNamed:@"effect_four.png"];
    
    // four filter
    UIImage *fourfilter = [UIImage imageNamed:@"effect_five.png"];
    
   // five filter
    UIImage *fivefilter = [UIImage imageNamed:@"effect_six.png"];
     UIImage *sixfilter = [UIImage imageNamed:@"effect_seven.png"];
     UIImage *sevenfilter = [UIImage imageNamed:@"effect_eight.png"];
    UIImage *eightfilter = [UIImage imageNamed:@"effect_nine.png"];

    
    
    

    CGFloat xPos;
    CGFloat yPos;
//    CGFloat width;
//    CGFloat height;
    
    xPos = 10;
    yPos = 10;
    width = 60;
    height = 80;

    
    arrButtonImages = [[NSMutableArray alloc] initWithObjects:orignalImage,fristFilter,secondfilter,thirdFilter,fourfilter,fivefilter,sixfilter,sevenfilter,eightfilter,nil];
    
    for (int i = 0 ; i< arrButtonImages.count; i++) {
        
        
        
        UIButton *btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnImage setBackgroundImage:self.selectedImage forState:UIControlStateNormal];
        
        [btnImage addTarget:self action:@selector(btnImageClicked:) forControlEvents:UIControlEventTouchUpInside];
        btnImage.tag = 100+i;
        btnImage.frame = CGRectMake(xPos, yPos, width, height);
        [scrollImage addSubview:btnImage];
        
        
        
        UIImageView *imgOriginal = [[UIImageView alloc] initWithFrame:btnImage.bounds];
        imgOriginal.image = [arrButtonImages objectAtIndex:i];
        imgOriginal.userInteractionEnabled = NO;
        [btnImage addSubview:imgOriginal];

        UIImageView *imgTrans = [[UIImageView alloc] initWithFrame:btnImage.bounds];
        imgTrans.image = transSelected;
        imgTrans.userInteractionEnabled = NO;
        [btnImage addSubview:imgTrans];

        
        xPos+=width+10;
    }
    
    [scrollImage setContentSize:CGSizeMake(xPos, scrollImage.frame.size.height)];
    
    
}

- (UIImage *)imageBlackAndWhite
{
    CIImage *beginImage = [[CIImage alloc] initWithImage:
                           self.selectedImage];
    
    
    CIImage *blackAndWhite = [CIFilter filterWithName:@"CIColorControls" keysAndValues:kCIInputImageKey, beginImage, @"inputBrightness", [NSNumber numberWithFloat:0.0], @"inputContrast", [NSNumber numberWithFloat:1.1], @"inputSaturation", [NSNumber numberWithFloat:0.0], nil].outputImage;
    CIImage *output = [CIFilter filterWithName:@"CIExposureAdjust" keysAndValues:kCIInputImageKey, blackAndWhite, @"inputEV", [NSNumber numberWithFloat:0.7], nil].outputImage;
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    return  [UIImage imageWithCGImage:[context
                                       createCGImage:output
                                       fromRect:output.extent]];
}



-(void)btnImageClicked:(UIButton*)sander
{
    if (sander.tag == 100)
    {
        mainImage1.image = self.selectedImage;
    }
    if (sander.tag==101)
    {
        //effectedImage.image = [UIImage imageNamed:@""];
        effectedImage.image = nil;
        mainImage1.image = [self imageBlackAndWhite];
    }
    else if (sander.tag==102)
    {
        effectedImage.image = [UIImage imageNamed:@"effect_three.png"];
       // mainImage1.image = [self filterTwoImage];

    }
    else if (sander.tag==103)
    {
        effectedImage.image = [UIImage imageNamed:@"effect_four.png"];

         }
    
    
    else if (sander.tag==104)
    {
        effectedImage.image = [UIImage imageNamed:@"effect_five.png"];

        
    }
    
    else if (sander.tag==105)
    {
        effectedImage.image = [UIImage imageNamed:@"effect_six.png"];

       
    }
    else if (sander.tag==106)
    {
        effectedImage.image = [UIImage imageNamed:@"effect_seven.png"];
        
       
    }

    else if (sander.tag==107)
    {
        effectedImage.image = [UIImage imageNamed:@"effect_eight.png"];
        
        
    }

    else if (sander.tag==108)
    {
        effectedImage.image = [UIImage imageNamed:@"effect_nine.png"];
        
        
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
