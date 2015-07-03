
//  MobileCaseView.h
//  CaseByeMe
//
//  Created by Kuldeep Saini on 14/05/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>




@protocol MobileCaseViewDelegate <NSObject>

-(void)btnScreenClicked:(UIImage*)imgName;
-(void)didSelectCase:(NSNumber*)currentTag;


@end


@interface MobileCaseView : UIView
{
    NSMutableArray *arrBtns;
    NSMutableArray *arrScreens;

}

@property(nonatomic,strong) UIButton *btnDrag;
@property(nonatomic,assign) id <MobileCaseViewDelegate>delegate;
-(instancetype)initWithFrame:(CGRect)frame;
//@property(nonatomic,assign) id <MobileCaseViewDelegate>delegate;
//
//- (instancetype)initWithFrame:(CGRect)frame;
//
@end
