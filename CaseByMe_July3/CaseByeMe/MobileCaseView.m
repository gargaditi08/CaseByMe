//
//  MobileCaseView.m
//  CaseByeMe
//
//  Created by Kuldeep Saini on 14/05/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import "MobileCaseView.h"

@implementation MobileCaseView
@synthesize delegate;
@synthesize btnDrag;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
       
        
    arrBtns = [[NSMutableArray alloc]initWithObjects:@"9.png",@"8_png",@"2.png",@"12.png",@"3.png",@"1.png",@"11.png",@"4.png", nil];
        
    arrScreens = [[NSMutableArray alloc]initWithObjects:@"zero.png",@"one.png",@"two.png",@"three.png",@"four.png",@"six.png",@"five.png",@"seven.png",@"eight.png",@"nine.png",@"ten.png",@"eleven.png", nil];
        
        [self designOptionView];
    }
    return self;
}

-(void)designOptionView
{
    
    btnDrag = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDrag.frame = CGRectMake(self.frame.size.width-45, self.frame.size.height-32, 45, 45);
    [btnDrag setBackgroundColor:[UIColor clearColor]];
    [btnDrag setImage:[UIImage imageNamed:@"slid_btn.png"] forState:UIControlStateNormal];
    [btnDrag addTarget:self action:@selector(btnDragClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnDrag];
    

    
    [self designScrollView];
    [self designScreenPhne];
    
      
}

-(void)btnDragClicked:(UIButton*)btnSender
{
 
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(btnDragClicked:)])
    {
        [self.delegate performSelector:@selector(btnDragClicked:) withObject:btnSender];
    }

}

-(void)designScreenPhne
{
    NSInteger xPos = 20;
    NSInteger yPos = 70;
    NSInteger width = 40;
    
    UIView *vwTemp = [[UIView alloc] initWithFrame:CGRectMake(0, yPos, self.frame.size.width, 100)];
    vwTemp.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:vwTemp];
    
    yPos = 0;
    for (int i= 0; i< arrScreens.count; i++)
    {
        
        UIButton *btnScreen = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnScreen addTarget:self action:@selector(btnScreenClicked:) forControlEvents:UIControlEventTouchUpInside];
        btnScreen.tag = 200+i;
        //[btnScreen setBackgroundColor:[UIColor clearColor]];
        btnScreen.frame = CGRectMake(xPos, yPos,width, 50);
        [vwTemp addSubview:btnScreen];
        [btnScreen setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[arrScreens objectAtIndex:i]]] forState:UIControlStateNormal];
        if ([[arrScreens objectAtIndex:i] isEqual:@"six.png"])
        {
         yPos = 50;
         xPos = 20;
        }
        else
        {
          xPos += width+20;
        }
        
        
    }
}

-(void)btnScreenClicked:(UIButton*)btnSender
{
//    NSString *imgName = [arrScreens objectAtIndex:btnSender.tag-200];
//    UIImage *img = [UIImage imageNamed:imgName];
    
    NSInteger currentRowTag = btnSender.tag - 200;

    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(btnScreenClicked:)])
    {
        [self.delegate performSelector:@selector(btnScreenClicked:) withObject:[NSNumber numberWithInteger:currentRowTag]];
    }
    
}

-(void)designScrollView
{
    UIScrollView *scrollBG = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0, CGRectGetWidth(self.frame), 70)];
    scrollBG.backgroundColor = [UIColor lightGrayColor];
     [self addSubview:scrollBG];
    
    
    NSInteger xPos = 10;
    NSInteger yPos = 5;
    NSInteger width = 60;
    NSInteger height = 60;
    
    
    
    for (int i = 0 ; i < arrBtns.count; i++)
    {
        
        UIButton *btnTempp = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnTempp addTarget:self action:@selector(btnTempClicked:) forControlEvents:UIControlEventTouchUpInside];
        btnTempp.tag = 100+i;
        //[btnTempp setBackgroundColor:[UIColor clearColor]];
        btnTempp.frame = CGRectMake(xPos, yPos, width, height);
        [scrollBG addSubview:btnTempp];
        [btnTempp setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[arrBtns objectAtIndex:i]]] forState:UIControlStateNormal];
        
        xPos+=width+10;
    }
    
    [scrollBG setContentSize:CGSizeMake(xPos, 70)];
}



-(void)btnTempClicked:(UIButton*)btnSender
{

    NSInteger currentRowTag = btnSender.tag - 100;

//    NSString *imgName = [arrBtns objectAtIndex:currentRowTag];

//    UIImage *selectdImage = [UIImage imageNamed:imgName];
    
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(didSelectCase:)])
    {
        [self.delegate performSelector:@selector(didSelectCase:) withObject:[NSNumber numberWithInteger:currentRowTag]];
    }
    
}


//-(void)getPhoneSizeImage: (UIButton *)sender
//{
//}

@end
