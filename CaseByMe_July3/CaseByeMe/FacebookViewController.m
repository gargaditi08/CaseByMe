//
//  FacebookViewController.m
//  CaseByeMe
//
//  Created by Dextrotech on 29/06/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import "FacebookViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "PhoneBGViewController.h"
@interface FacebookViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

{
    UICollectionView *ImagecollectionView;
    NSMutableArray *arrProject;
}

@end

@implementation FacebookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    ImagecollectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height-64) collectionViewLayout:layout];
    [ImagecollectionView setDataSource:self];
    [ImagecollectionView setDelegate:self];
    
    [ImagecollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [ImagecollectionView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:ImagecollectionView];
    [self getImage];
    
}

-(void)getImage
{
    

if ([FBSDKAccessToken currentAccessToken])
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"/me/Photos" parameters:nil]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         if (!error) {
             
             
             [self performSelectorOnMainThread:@selector(deleteCellMethod:) withObject:result waitUntilDone:YES];
             //NSLog(@"fetched user:%@", result);
             
         }
     }];
}

else{
    // ....
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logInWithReadPermissions:@[@"email",@"user_photos"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
                        // Process error
                        NSLog(@"Error");
                    } else if (result.isCancelled) {
                        // Handle cancellations
                        NSLog(@"Cancel");
                    } else {
                        // If you ask for multiple permissions at once, you
                        // should check if specific permissions missing
                        if ([result.grantedPermissions containsObject:@"email"]) {
                            // Do work
                           // NSLog(@"Login OK");
            
                                if ([FBSDKAccessToken currentAccessToken])
                                {
                                    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                                    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"/me/Photos" parameters:nil]
                                     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                                         if (!error) {
                                             [self performSelectorOnMainThread:@selector(deleteCellMethod:) withObject:result waitUntilDone:YES];
                                         }
                                     }];
                                }
            
                        }
                    }

    }];
}
}
-(void)deleteCellMethod:(id)json
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSMutableArray *dic=[json objectForKey:@"data"];
    
    if (dic == (id)[NSNull null])
    {
        // [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
    
    else
    {
        
        if(arrProject){
            [arrProject removeAllObjects];
        }
        else{
            arrProject = [NSMutableArray new];
        }
        
        
        for (NSDictionary *dic1 in dic)
        {
            NSString *myString = [dic1 objectForKey:@"source"];
            
           //NSLog(@"ttttt=%@",myString);
            
            [arrProject addObject:myString];
        }
    }
  [ImagecollectionView  reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return arrProject.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
   //KartisBO *kartis = [ImagesName objectAtIndex:indexPath.row];
    NSString *imageString = [arrProject objectAtIndex:indexPath.row];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^
                   {
                       
                       //NSString *string = [NSString stringWithFormat:@"http://www.hilisten.in/demoproject/Nursing/img/%@",imageString];
                       NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageString]];
                       
                       UIImage *image = [UIImage imageWithData:data];
                       dispatch_async(dispatch_get_main_queue(), ^{
                           UIImageView *recipeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 80, 80)];
                           [cell addSubview:recipeImageView];
                           recipeImageView.tag = 100;
                           
                           recipeImageView.image = image;//[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:string]]];
                           
                           //cell.frame = CGRectMake(10, 65, 300, 100);
                           ///cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:string]]]];
                       });
                   });
    
    
    cell.backgroundColor=[UIColor clearColor];
    // [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(90, 90);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *imageString = [arrProject objectAtIndex:indexPath.row];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageString]];
    UIImage *image = [UIImage imageWithData:data];
    [DELEGATE.galleryArray addObject:image];
    PhoneBGViewController *aditi = [[PhoneBGViewController alloc]init];
    [self.navigationController pushViewController:aditi animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
