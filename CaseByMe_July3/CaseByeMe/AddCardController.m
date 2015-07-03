//
//  AddCardController.m
//  CaseByeMe
//
//  Created by Dextrotech on 17/06/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import "AddCardController.h"
#import "Constant.h"
@interface AddCardController ()
{
    NSMutableArray *arrLabel;
    NSMutableArray *arrLabel2;
}
@end

@implementation AddCardController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
   // CGFloat yPos1= 70;

    UIImageView *borderImage = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, self.view.frame.size.width-200, 100)];
    borderImage.image = [UIImage imageNamed:@""];
    borderImage.layer.cornerRadius = 5.0f;
    borderImage.clipsToBounds = YES;
    borderImage.layer.borderWidth = 1;
    borderImage.layer.borderColor =[UIColor blackColor].CGColor;
    [self.view addSubview:borderImage];
    // borderImage.backgroundColor = [UIColor clearColor];
    
    
   UIImageView *mainImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(130, 110, CGRectGetWidth(self.view.frame)-260, 80)];
    //mainImage1.contentMode = UIViewContentModeScaleAspectFill;
    mainImage1.image = self.finalImage;
    // mainImage1.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:mainImage1];
    
    
   
    UIButton *addCart = [[UIButton alloc]initWithFrame:CGRectMake(60, self.view.frame.size.height-60, self.view.frame.size.width-120, 35)];
    [self.view addSubview:addCart];
    [addCart setImage:[UIImage imageNamed:@"cart.png"] forState:UIControlStateNormal];
    [addCart addTarget:self action:@selector(addCartActn) forControlEvents:UIControlEventTouchUpInside];
    
    
    arrLabel = [[NSMutableArray alloc]initWithObjects:@"SmartPhone",@"Filters",@"LayoutEffects" ,nil];
    arrLabel2 =[[NSMutableArray alloc]initWithObjects:@"Samsung Galaxy",@"3 Partition",@"Seperia" ,nil];
    
    CGFloat xPos = 50;
    CGFloat yPos = 220;
    CGFloat width = 150;
    CGFloat height = 30;
    for (int i = 0; i < arrLabel.count; i++) {
        
        UILabel *label1= [[UILabel alloc]initWithFrame:CGRectMake(xPos, yPos, width, height)];
        [self.view addSubview:label1];
        label1.text =[NSString stringWithFormat:@"%@",[arrLabel objectAtIndex:i]]; //[arrLabel objectAtIndex:i];
        label1.textColor =[UIColor blackColor];
        label1.font = [UIFont systemFontOfSize:12.0];
        
        yPos+=30;

    }
    
    
    xPos = self.view.frame.size.width-150;
    yPos = 220;
     width = 150;
    height = 30;
    for (int i = 0; i < arrLabel2.count; i++) {
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(xPos, yPos, width, height)];
        [self.view addSubview:label2];
        label2.text = [NSString stringWithFormat:@"%@",[arrLabel2 objectAtIndex:i]];//[arrLabel2 objectAtIndex:i];
        label2.textColor = [UIColor blackColor];
        label2.font = [UIFont systemFontOfSize:12.0];
        
        
        yPos+=30;
        
    }
    

    
    
   
}

-(void)addCartActn
{
    
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
