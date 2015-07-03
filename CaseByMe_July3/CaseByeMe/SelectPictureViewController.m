//
//  SelectPictureViewController.m
//  CaseByeMe
//
//  Created by Kuldeep Saini on 15/05/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import "SelectPictureViewController.h"
#import "3DEffectViewController.h"
#import "AditiViewController.h"
#import "FacebookViewController.h"
#import "InstagramController.h"
@interface SelectPictureViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrGalary;
    UIScrollView *scrollView;
    NSArray *chosenImages;
   
}

@end

@implementation SelectPictureViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    arrGalary = [[NSMutableArray alloc]initWithObjects:@"Select from Instagram",@"Select from Facebook",@"Select from Camera",@"Select from Galary", nil];
    
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:table];
    table.delegate = self;
    table.dataSource = self;
    
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 60, 60)];
//    [self.view addSubview:button];
//    [button setTitle:@"click" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(buttnClick) forControlEvents:UIControlEventTouchUpInside];
//    button.backgroundColor = [UIColor blueColor];
//    
//    
}

-(void)buttnClick
{

    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    
    return arrGalary.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    static NSString *str = @"str";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell ==nil)
    {
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text= [arrGalary objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"AlNile" size:16];
    cell.textLabel.textColor = [UIColor colorWithRed:200.0/255.0 green:196.0/255.0 blue:149.0/255.0 alpha:1.0];


}

return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.row==0)
    {
        InstagramController *gurjar = [[InstagramController alloc]init];
        [self.navigationController pushViewController:gurjar animated:NO];
    }
    
    if (indexPath.row == 1)
    {
        FacebookViewController *aditi = [[FacebookViewController alloc]init];
        [self.navigationController pushViewController:aditi animated:NO];
    }
    
    
    if (indexPath.row == 2)
    {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                  message:@"Device has no camera"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            
            [myAlertView show];
            
        }
     else
        {
            
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
            
        }
    }
    
    if (indexPath.row == 3)
    {
        ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
        
        elcPicker.maximumImagesCount = 5; //Set the maximum number of images to select to 100
        elcPicker.returnsOriginalImage = YES; //Only return the fullScreenImage, not the fullResolutionImage
        elcPicker.returnsImage = YES; //Return UIimage if YES. If NO, only return asset location information
        elcPicker.onOrder = YES; //For multiple image selection, display and return order of selected images
        elcPicker.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie]; //Supports image and movie types
        
        elcPicker.imagePickerDelegate = self;
        
        [self presentViewController:elcPicker animated:YES completion:nil];
 
    }
    else
    {
    //AditiViewController *aditi = [[AditiViewController alloc]init];
    //[self.navigationController pushViewController:aditi animated:YES];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    [DELEGATE.galleryArray addObject:chosenImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    [self.navigationController popViewControllerAnimated:NO];
    
//    PhoneBackgroundController *aditi = [[PhoneBackgroundController alloc]init];
//    [self.navigationController pushViewController:aditi animated:NO];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    for (UIView *v in [scrollView subviews]) {
        [v removeFromSuperview];
    }
    
    CGRect workingFrame = scrollView.frame;
    workingFrame.origin.x = 0;
    
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:[info count]];
    for (NSDictionary *dict in info) {
        if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypePhoto){
            if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
                UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                [images addObject:image];
                [DELEGATE.galleryArray addObject:image];
                UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
                [imageview setContentMode:UIViewContentModeScaleAspectFit];
                imageview.frame = workingFrame;
                
                [scrollView addSubview:imageview];
                
                workingFrame.origin.x = workingFrame.origin.x + workingFrame.size.width;
            } else {
                NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
            }
            //        } else if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypeVideo){
            //            if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
            //                UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
            //
            //                [images addObject:image];
            //
            //                UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
            //                [imageview setContentMode:UIViewContentModeScaleAspectFit];
            //                imageview.frame = workingFrame;
            //
            //                [scrollView addSubview:imageview];
            //
            //                workingFrame.origin.x = workingFrame.origin.x + workingFrame.size.width;
            //            } else {
            //                NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
            //            }
            //        }
            //
            //            else
            //            {
            //            NSLog(@"Uknown asset type");
        }
    }
    
    // self.chosenImages = images;
    
    [scrollView setPagingEnabled:YES];
    [scrollView setContentSize:CGSizeMake(workingFrame.origin.x, workingFrame.size.height)];
    
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
//    PhoneBackgroundController *aditi = [[PhoneBackgroundController alloc]init];
//    [self.navigationController pushViewController:aditi animated:NO];
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
