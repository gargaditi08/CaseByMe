//
//  CaseFrameView.h
//  CaseByeMe
//
//  Created by Kuldeep Saini on 27/06/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICMCollageElementView.h"


#define CASE_STARTING_TAG 5000

@interface CaseFrameView : UIView
@property(nonatomic,assign) NSInteger CaseDesignedFor;

- (instancetype)initWithFrame:(CGRect)frame withCase:(NSInteger)designedFor;

-(void)designFrameForCaseOne;
@end
