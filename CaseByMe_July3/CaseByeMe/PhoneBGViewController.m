//
//  PhoneBGViewController.m
//  CaseByeMe
//
//  Created by Kuldeep Saini on 26/06/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import "PhoneBGViewController.h"
#import "SelectPictureViewController.h"
#import "MobileCaseView.h"
#import "CaseFrameView.h"
#import "UIView+ImageRender.h"
#import "AditiViewController.h"

@interface PhoneBGViewController ()<MobileCaseViewDelegate,UIGestureRecognizerDelegate,UIAlertViewDelegate>
{
    UIScrollView *scrollImage;
    UIImageView *vwDrag;
    
    NSMutableArray *arrMaskImage;
    NSMutableArray *arrTransparentImage;
    
    UIView *vwMobileMainBackground;
    
    UIImageView *imgvwPhoneBG;
    UIImageView *imgvwTransBG;
    
    UIView *vwFrameBackground;
    UIImageView *infoImage;

    CaseFrameView *vwFrameCase;
    UIButton *helpBtn;
    BOOL isForFirstTime;
}


@property(nonatomic,strong)MobileCaseView *mobileCase;

@end

@implementation PhoneBGViewController
@synthesize mobileCase;


-(void)fillArrayForImages{
    
    arrMaskImage = [[NSMutableArray alloc] initWithObjects:@"iphone6_mask.png",@"iphone6_mask.png",@"iphone5_mask.png",@"LG_g3_mask.png",@"Galaxys5_mask.png",@"Galaxys4_mask.png",@"GalaxyNote4_mask.png",@"GalaxyNote3Phone_mask.png", nil];
    
    arrTransparentImage = [[NSMutableArray alloc] initWithObjects:@"iphone6Trans.png",@"iphone6Trans.png",@"iphone5Trans.png",@"Lg_g3_Trans.png",@"Galaxys5Trans.png",@"Galaxys4Trans.png",@"GalaxyNote4Trans.png",@"GalaxyNote3Trans.png", nil];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    isForFirstTime = YES;
    // Fill Array for required Images
    [self fillArrayForImages];
    
    // Add Top Navigation Bar buttons for Next and Back
    [self addTopNavigationBarButtons];
    
    
   
    
    // Design Main Phone Background Screen
    [self designPhoneBGScreen];

    
    // Design Bottom Gallery View.
    [self designBottomGalleryView];
    
    // Design Top Option View for choosing frames and design
    [self designOptionView];
    

    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchTutorialView)];
    
    infoImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    [infoImage addGestureRecognizer:tap];
    infoImage.userInteractionEnabled = YES;
    [self.view addSubview:infoImage];
    infoImage.image = [UIImage imageNamed:@"tuto.png"];

    helpBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, self.view.frame.size.height-110, 50, 50)];
    [helpBtn setImage:[UIImage imageNamed:@"info.png"] forState:UIControlStateNormal];
    [helpBtn addTarget:self action:@selector(showImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:helpBtn];
    
    [self addFirstframeontheview];

   
}

-(void)touchTutorialView
{
    helpBtn.selected = !helpBtn.selected;
    infoImage.hidden = YES;
}

-(void)showImage:(UIButton *)sendar
{
    
    helpBtn.selected = !helpBtn.selected;
    
    
    [self infoButtonClick:helpBtn.selected];
    
}
-(void)infoButtonClick:(BOOL)infoImage1
{
 
    if(infoImage1)
    {
        infoImage.hidden = YES;
    }
    else
    {
        infoImage.hidden = NO;
    }
    
    [self.view bringSubviewToFront:infoImage];

}
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    infoImage.hidden = YES;
//    [super touchesBegan:touches withEvent:event];
//    
//}
//

-(void)designBottomGalleryView{
    
    
    CGFloat screenHeight = self.view.frame.size.height;
    
     CGFloat yPos = screenHeight-60;
    
    UIImageView *selectedImageBG = [[UIImageView alloc]initWithFrame:CGRectMake(0, yPos, self.view.frame.size.width, 80)];
    selectedImageBG.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:(0.5)];
    [self.view addSubview:selectedImageBG];
    
    yPos = screenHeight-55;
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10,yPos , 50 , 50)];
    [button setImage:[UIImage imageNamed:@"pic.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button];
    
    // Now create bottom SCroll view for all facebook images.
    scrollImage = [[UIScrollView alloc] initWithFrame:CGRectMake(60, yPos, CGRectGetWidth(self.view.frame)-60, 60)];
    scrollImage.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scrollImage];


    // Desgin gallery Items on Bottom Scroll
    [self prepareGalleryItemsOnScroll];
}


-(void)prepareGalleryItemsOnScroll
{
    
    // First remove all existing views
    [[scrollImage subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat xPos = 10;
    CGFloat yPos = 0;
    CGFloat width = 50;
    CGFloat height = 50;
    
    for (int i = 0 ; i< DELEGATE.galleryArray.count; i++) {
        
        UIButton *btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnImage setBackgroundImage:[DELEGATE.galleryArray objectAtIndex:i] forState:UIControlStateNormal];
        btnImage.frame = CGRectMake(xPos, yPos, width, height);
        btnImage.tag = 100+i;
        [scrollImage addSubview:btnImage];
        
        
        UILongPressGestureRecognizer *moveItemGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(framePickUp:)];
        ;
        [moveItemGesture setMinimumPressDuration:0.1];
        moveItemGesture.delegate=self;
        [btnImage addGestureRecognizer:moveItemGesture];
        
        
        xPos+=width+10;
    }
    
    [scrollImage setContentSize:CGSizeMake(xPos, scrollImage.frame.size.height)];

}

-(void)viewWillAppear:(BOOL)animated{
 
    if([DELEGATE.galleryArray count]){
        
        [self prepareGalleryItemsOnScroll];
    }
}



-(void)designPhoneBGScreen{
    
    NSInteger yPos = 100;
    
    CGFloat screenHeight = self.view.frame.size.height;
    CGFloat height = screenHeight-80-yPos;
    CGFloat width = CGRectGetWidth(self.view.frame)-100;

    vwMobileMainBackground = [[UIView alloc] initWithFrame:CGRectMake(50, yPos, width, height)];
    vwMobileMainBackground.backgroundColor = [UIColor clearColor];
    [self.view addSubview:vwMobileMainBackground];
    
    
    vwFrameBackground = [[UIView alloc] initWithFrame:vwMobileMainBackground.bounds];
    vwFrameBackground.backgroundColor = [UIColor clearColor];
    [vwMobileMainBackground addSubview:vwFrameBackground];
    
    
    imgvwPhoneBG = [[UIImageView alloc] initWithFrame:vwMobileMainBackground.bounds];
    imgvwPhoneBG.backgroundColor = [UIColor clearColor];
    imgvwPhoneBG.image = [UIImage imageNamed:@"iphone6_mask.png"];
    [vwMobileMainBackground addSubview:imgvwPhoneBG];
    
    imgvwTransBG = [[UIImageView alloc] initWithFrame:vwMobileMainBackground.bounds];
    imgvwTransBG.backgroundColor = [UIColor clearColor];
    imgvwTransBG.image = [UIImage imageNamed:@"iphone6Trans.png"];
    [vwMobileMainBackground addSubview:imgvwTransBG];
    
    
    
    [self.view bringSubviewToFront:mobileCase];

    
}


#pragma mark- Drag Code
#pragma mark-
-(void)framePickUp:(UILongPressGestureRecognizer*)recognizer
{
    

    
    NSInteger currentImageIndex = [recognizer view].tag-100;
    
    CGPoint gesturepoint = [recognizer locationInView:self.view];
    
    if(recognizer.state == UIGestureRecognizerStateBegan)
    {
        if(isForFirstTime){
            isForFirstTime = NO;
        mobileCase.btnDrag.selected = !mobileCase.btnDrag.selected;
        [self moveViewToUpSide:mobileCase.btnDrag.selected];
        }
        NSLog(@"State Began");
        if(vwDrag)
        {
            [vwDrag.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            [vwDrag removeFromSuperview];
            vwDrag = nil;
        }
        
        
        vwDrag = [[UIImageView alloc] initWithFrame:CGRectMake(gesturepoint.x, gesturepoint.y, 80, 80)];
        vwDrag.center = gesturepoint;
        vwDrag.userInteractionEnabled = YES;
        vwDrag.image = [DELEGATE.galleryArray objectAtIndex:currentImageIndex];
        [self.view addSubview:vwDrag];
        //if needed do some initial setup or init of views here
        
        UITapGestureRecognizer *tapItem = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTheMainDraggedView:)];
        [tapItem setNumberOfTapsRequired:1];
        tapItem.delegate=self;
        [vwDrag addGestureRecognizer:tapItem];

    }
    else if(recognizer.state == UIGestureRecognizerStateChanged)
    {
        
        NSLog(@"State Changed>......");

        //move your views here.
        vwDrag.center = gesturepoint;

    }
    else if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"State Ended>......");

        //else do cleanup
        [self checkFrameExistence:gesturepoint];

    }
}

-(void)checkFrameExistence:(CGPoint)dragPoint{

    
    // Decrease the drag point, since touch is checking on self.view and we have to drop on vwframe.
    dragPoint.x -= 50;
    dragPoint.y -= 100;
    
    
    for (UIImageView* imgVw in vwFrameCase.subviews) {

        if (CGRectContainsPoint(imgVw.frame, dragPoint)) {
            NSLog(@"Frame Exist, Now trying to add an image");
            imgVw.image = vwDrag.image;
            [self performSelector:@selector(removeExistingView) withObject:nil afterDelay:0.1];

            break;
        }
    }
    
    [self performSelector:@selector(removeExistingView) withObject:nil afterDelay:0.1];

}


-(void)removeTheMainDraggedView:(UITapGestureRecognizer*)tapGest
{
    [self removeExistingView];
}

-(void)removeExistingView
{
    if(vwDrag)
    {
        [vwDrag.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [vwDrag removeFromSuperview];
        vwDrag = nil;
    }
    
}



#pragma mark- Navigate To Choose Gallery
#pragma mark- 

-(void)clickClicked
{
    SelectPictureViewController *selectPic = [[SelectPictureViewController alloc]init];
    [self.navigationController pushViewController:selectPic animated:NO];
}



#pragma mark- OPTION VIEW
#pragma mark-
-(void)designOptionView
{
    
    mobileCase = [[MobileCaseView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200)];
    mobileCase.delegate = self;
    mobileCase.backgroundColor = [UIColor clearColor];
    [self.view addSubview:mobileCase];
}


#pragma mark- OPTION Delegate

-(void)btnScreenClicked:(NSNumber*)sender
{
    infoImage.hidden = YES;

    
    mobileCase.btnDrag.selected = !mobileCase.btnDrag.selected;
    [self moveViewToUpSide:mobileCase.btnDrag.selected];

    NSInteger currentFrameTag = [sender integerValue];
    
    CGRect bounds = vwFrameBackground.bounds;
    
    if(vwFrameCase){
        [vwFrameCase.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        vwFrameCase = nil;
    }

    vwFrameCase = [[CaseFrameView alloc] initWithFrame:bounds withCase:currentFrameTag];
    [vwFrameBackground addSubview:vwFrameCase];
}

-(void)didSelectCase:(NSNumber*)currentTag;
{
    infoImage.hidden = YES;

    mobileCase.btnDrag.selected = !mobileCase.btnDrag.selected;
    [self moveViewToUpSide:mobileCase.btnDrag.selected];
    
    NSInteger currentRow = [currentTag integerValue];
    
    
    imgvwPhoneBG.image = [UIImage imageNamed:arrMaskImage[currentRow]];
    imgvwTransBG.image = [UIImage imageNamed:arrTransparentImage[currentRow]];
}

-(void)addFirstframeontheview
{
    
    NSInteger currentFrameTag = 0;

    CGRect bounds = vwFrameBackground.bounds;
    
    if(vwFrameCase){
        [vwFrameCase.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        vwFrameCase = nil;
    }
    
    vwFrameCase = [[CaseFrameView alloc] initWithFrame:bounds withCase:currentFrameTag];
    [vwFrameBackground addSubview:vwFrameCase];

}


-(void)btnDragClicked:(UIButton*)btnSender
{
    btnSender.selected = !btnSender.selected;
     infoImage.hidden = YES;
    [self moveViewToUpSide:btnSender.selected];
    
}

-(void)moveViewToUpSide:(BOOL)isUp
{
    CGRect currentFrame = mobileCase.frame;
    
    if(isUp)
        currentFrame.origin.y = -mobileCase.frame.size.height+64+30;
    else
        currentFrame.origin.y = 64;
    
    [UIView animateWithDuration:0.5 animations:^{
        mobileCase.frame = currentFrame;
        
    }completion:nil];
    
    [self.view bringSubviewToFront:mobileCase];
}




-(void)addTopNavigationBarButtons
{
    UIBarButtonItem *Next = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(GoNext:)];
    Next.tag = 200;

   [Next setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal style:UIBarButtonItemStylePlain barMetrics:0];
    self.navigationItem.rightBarButtonItem = Next;
    
    UIBarButtonItem *Back = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(GoNext:)];
    Back.tag = 201;
    [Back setBackgroundImage:[UIImage imageNamed:@"back-1.png"] forState:UIControlStateNormal style:UIBarButtonItemStylePlain barMetrics:0];
    self.navigationItem.leftBarButtonItem = Back;

}

-(void)GoNext:(UIButton *)sendar
{
    switch (sendar.tag) {
        case 200: // Next
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Are you sure to move to next Screen ?" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"NO", nil];
            
            alert.tag = 20;
            [alert show];

        }
            break;
        case 201: // Back
        {
            [DELEGATE.galleryArray removeAllObjects];
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;

            
        default:
            break;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
   
    if (alertView.tag == 20)
    {
   
    if (buttonIndex == 0)
    {
     AditiViewController *rotateVw1 = [[AditiViewController alloc]init];
     rotateVw1.selectedImage = [vwMobileMainBackground renderImage];
     rotateVw1.transSelected = imgvwTransBG.image;
     [self.navigationController pushViewController:rotateVw1 animated:YES];
    }
    else{
        //reset clicked
    }
        
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
