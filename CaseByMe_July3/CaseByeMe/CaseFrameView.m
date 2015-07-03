//
//  CaseFrameView.m
//  CaseByeMe
//
//  Created by Kuldeep Saini on 27/06/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import "CaseFrameView.h"

@implementation CaseFrameView
@synthesize CaseDesignedFor;

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


- (instancetype)initWithFrame:(CGRect)frame withCase:(NSInteger)designedFor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.CaseDesignedFor = designedFor;
        [self designMobileFrameToBeDesigned];
    }
    return self;
}




-(void)designMobileFrameToBeDesigned{
    
    switch (self.CaseDesignedFor) {
            
        case 0:
            [self designFrameForCaseOne];
            break;
            
        case 1:
            [self designFrameForCaseTwo];
            break;
            
        case 2:
            [self designFrameForCaseThree];
            break;
            
        case 3:
            [self designFrameForCaseFour];
            break;
            
        case 4:
            [self designFrameForCaseFive];
            break;
            
        case 5:
            [self designFrameForCaseSix];
            break;
            
        case 6:
            [self designFrameForCaseSeven];
            break;
            
        case 7:
            [self designFrameForCaseEight];
            break;
            
        case 8:
            [self designFrameForCaseNine];
            break;
        case 9:
            [self designFrameForCaseTen];
            break;
        case 10:
            [self designFrameForCaseEleven];
            break;
        case 11:
            [self designFrameForCaseTwelve];
            break;
            
            
            
            
        default:
            break;
    }
}


-(ICMCollageElementView*)designCollageBaseWithPinchGestureWithFrame:(CGRect)frame andTag:(NSInteger)tag
{
    ICMCollageElementView *imgFrame = [[ICMCollageElementView alloc] init];
    imgFrame.frame = frame;
    imgFrame.userInteractionEnabled = YES;
    imgFrame.tag = tag;
    imgFrame.backgroundColor = [UIColor clearColor];//colorWithAlphaComponent:(0.1)];
    imgFrame.layer.borderColor = [UIColor darkGrayColor].CGColor;
    imgFrame.layer.borderWidth = 0.5;
    
    return imgFrame;
}


-(UIImageView*)designCollageBaseViewWithFrame:(CGRect)frame andTag:(NSInteger)tag
{
    UIImageView *imgFrame = [[UIImageView alloc] initWithFrame:frame];
    imgFrame.userInteractionEnabled = YES;
    imgFrame.tag = tag;
    imgFrame.backgroundColor = [UIColor clearColor];//colorWithAlphaComponent:(0.1)];
    imgFrame.layer.borderColor = [UIColor darkGrayColor].CGColor;
    imgFrame.layer.borderWidth = 0.5;
    
    return imgFrame;
}

-(void)designFrameForCaseOne{
    
    ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:self.bounds andTag:CASE_STARTING_TAG];
    
    [self addSubview:imgFrame];
}

-(void)designFrameForCaseTwo{
    
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height / 2;
    
    for (int i = 0 ; i< 2; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i];
        [self addSubview:imgFrame];
        
        yPos+=height;
    }
}

-(void)designFrameForCaseSix{
    
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height / 3;
    
    for (int i = 0 ; i< 3; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i];
        [self addSubview:imgFrame];
        
        yPos+=height;
    }
    
}

-(void)designFrameForCaseThree{
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    CGFloat width = self.frame.size.width/2;
    CGFloat height = self.frame.size.height ;
    
    for (int i = 0 ; i< 2; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i];
        [self addSubview:imgFrame];
        
        xPos+=width;
    }
    
    
}

-(void)designFrameForCaseFour{
    
    
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    CGFloat width = self.frame.size.width/2;
    CGFloat height = self.frame.size.height/2;
    
    for (int i = 0 ; i< 2; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i];
        [self addSubview:imgFrame];
        
        xPos+=width;
    }
    yPos +=height;
    xPos= 0;
    width = self.frame.size.width;
    height = self.frame.size.height/2;
    
    ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+2];
    [self addSubview:imgFrame];
    
}


-(void)designFrameForCaseTwelve{
    
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    CGFloat width = self.frame.size.width/2;
    CGFloat height = self.frame.size.height/4;
    
    for (int i = 0 ; i< 4; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i];
        [self addSubview:imgFrame];
        
        yPos+=height;
    }
    
    yPos = 0;
    xPos+=width;
    height = self.frame.size.height;
    
    ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+4];
    [self addSubview:imgFrame];
    
    
}

-(void)designFrameForCaseTen{
    
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    CGFloat width = self.frame.size.width/2;
    CGFloat height = self.frame.size.height/3;
    
    for (int i = 0 ; i< 2; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i];
        [self addSubview:imgFrame];
        yPos+=height;
    }
    
    height = height/2;
    
    for (int i = 2 ; i< 4; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i];
        [self addSubview:imgFrame];
        yPos+=height;
    }
    
    
    yPos = 0;
    xPos+=width;
    
    for (int i = 4 ; i< 6; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i];
        [self addSubview:imgFrame];
        yPos+=height;
    }
    
    height = self.frame.size.height/3;
    
    for (int i = 6 ; i< 8; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i];
        [self addSubview:imgFrame];
        yPos+=height;
    }
    
    
}
-(void)designFrameForCaseEleven{
    
    CGFloat xPos = 50;
    CGFloat yPos = 50;
    CGFloat width = self.frame.size.width-100;
    CGFloat height = width;
    
    ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG];
    imgFrame.layer.cornerRadius = width/2;
    imgFrame.clipsToBounds = YES;
    imgFrame.center = self.center;
    [self addSubview:imgFrame];
}




-(void)designFrameForCaseFive
{
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height/2;
    
    ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+1];
    [self addSubview:imgFrame];
    
    yPos+=height;
    xPos = 0;
    width=self.frame.size.width/2;
    height=self.frame.size.height/2;
    
    
    for (int i = 0 ; i< 2; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i+1];
        [self addSubview:imgFrame];
        
        xPos+=width;
    }
    
}

-(void)designFrameForCaseSeven
{
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    CGFloat width = self.frame.size.width/2;
    CGFloat height = self.frame.size.height/2;
    
    for (int i = 0 ; i< 2; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i];
        [self addSubview:imgFrame];
        
        xPos+=width;
    }
    yPos+=height;
    xPos = 0;
    width=self.frame.size.width/2;
    height=self.frame.size.height/2;
    
    
    for (int i = 0 ; i< 2; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i+1];
        [self addSubview:imgFrame];
        
        xPos+=width;
    }
    
}

-(void)designFrameForCaseEight
{
    
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height/2;
    
    ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+1];
    [self addSubview:imgFrame];
    
    
    yPos+=height;
    xPos = 0;
    
    width = self.frame.size.width/2;
    height = self.frame.size.height/4;
    
    for (int i = 1 ; i< 3; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i+1];
        [self addSubview:imgFrame];
        
        xPos+=width;
    }
    yPos+=height;
    xPos = 0;
    width=self.frame.size.width/2;
    height=self.frame.size.height/4;
    
    
    for (int i = 1 ; i< 3; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i+1];
        [self addSubview:imgFrame];
        
        xPos+=width;
        
    }
    
    
}

-(void)designFrameForCaseNine
{
    
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    CGFloat width = self.frame.size.width/2;
    CGFloat height = self.frame.size.height/4;
    
    for (int i = 0 ; i< 4; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+i];
        [self addSubview:imgFrame];
        
        yPos+=height;
    }
    
    yPos = 0;
    xPos+=width;
    width = self.frame.size.width/2;
    height = self.frame.size.height/4;
    
    for (int i = 0 ; i< 4; i++) {
        ICMCollageElementView *imgFrame = [self designCollageBaseWithPinchGestureWithFrame:CGRectMake(xPos, yPos, width, height) andTag:CASE_STARTING_TAG+4+i];
        [self addSubview:imgFrame];
        
        yPos+=height;
        
    }
    
    
}


@end
