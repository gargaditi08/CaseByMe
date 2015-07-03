//
//  ContactViewController.m
//  CaseByeMe
//
//  Created by Dextrotech on 12/06/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import "ContactViewController.h"
#import <MessageUI/MessageUI.h>
@interface ContactViewController () <UITextFieldDelegate,UITextViewDelegate,MFMailComposeViewControllerDelegate>
{
    UIScrollView *scroll;
    UITextField *nameTxt;
    UITextField *phoneTxt;
    UITextField *emailTxt;
    UITextField *pinCode;
    UITextView *addressText;
}

@end

@implementation ContactViewController
@synthesize finalImage;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //NSLog(@"%@",finalImage);
    // Do any additional setup after loading the view.
    [self designcontact];
}
-(void)designcontact
{
    CGFloat yPos;
    scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scroll];
    scroll.userInteractionEnabled = YES;
   scroll.contentSize= CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+150);
    //scroll.backgroundColor = [UIColor clearColor];
    scroll.scrollEnabled = YES;
    scroll.backgroundColor = [UIColor clearColor];
    scroll.showsVerticalScrollIndicator = YES;
    
    UILabel *Namelbl = [[UILabel alloc]initWithFrame:CGRectMake(5, yPos+30, 80, 40)];
    Namelbl.text = @"Name";
    Namelbl.font = [UIFont boldSystemFontOfSize:13.0f];
    Namelbl.textAlignment = NSTextAlignmentLeft;
    Namelbl.textColor = [UIColor blackColor];
    [scroll addSubview:Namelbl];
    
    nameTxt = [[UITextField alloc]initWithFrame:CGRectMake(90, yPos+30,self.view.frame.size.width-100, 40)];
    nameTxt.borderStyle = UITextBorderStyleBezel;
    nameTxt.textAlignment = NSTextAlignmentCenter;
    [scroll addSubview:nameTxt];
    nameTxt.delegate = self;
    nameTxt.placeholder = @"Name";
    //nameTxt.backgroundColor = [UIColor lightGrayColor];
    //[dateText setValue:[UIColor blackColor]forKeyPath:@"_placeholderLabel.textColor"];
    nameTxt.tag = 100;
    
    UILabel *Namelbl1 = [[UILabel alloc]initWithFrame:CGRectMake(5, yPos+85, 80, 40)];
    Namelbl1.text = @"Email ID";
    Namelbl1.font = [UIFont boldSystemFontOfSize:13.0f];
    Namelbl1.textAlignment = NSTextAlignmentLeft;
    Namelbl1.textColor = [UIColor blackColor];
    [scroll addSubview:Namelbl1];
    
    emailTxt = [[UITextField alloc]initWithFrame:CGRectMake(90, yPos+85,self.view.frame.size.width-100, 40)];
    emailTxt.borderStyle = UITextBorderStyleBezel;
    emailTxt.textAlignment = NSTextAlignmentCenter;
    emailTxt.keyboardType = UIKeyboardTypeEmailAddress;
    [scroll addSubview:emailTxt];
    emailTxt.delegate = self;
    emailTxt.placeholder = @"Email ID";
    //emailTxt.backgroundColor = [UIColor lightGrayColor];
    //[companyText setValue:[UIColor blackColor]forKeyPath:@"_placeholderLabel.textColor"];
    emailTxt.tag= 101;
    
    UILabel *Namelbl2 = [[UILabel alloc]initWithFrame:CGRectMake(5, yPos+140, 80, 40)];
    Namelbl2.text = @"Phone No.";
    Namelbl2.font = [UIFont boldSystemFontOfSize:13.0f];
    Namelbl2.textAlignment = NSTextAlignmentLeft;
    Namelbl2.textColor = [UIColor blackColor];
    [scroll addSubview:Namelbl2];

    
    phoneTxt = [[UITextField alloc]initWithFrame:CGRectMake(90, yPos+140,self.view.frame.size.width-100, 40)];
    phoneTxt.borderStyle = UITextBorderStyleBezel;
    phoneTxt.textAlignment = NSTextAlignmentCenter;
    phoneTxt.keyboardType = UIKeyboardTypePhonePad;
    [scroll addSubview:phoneTxt];
    phoneTxt.delegate = self;
    phoneTxt.tag= 102;
    phoneTxt.placeholder = @"Phone Number";
   // phoneTxt.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *Namelbl3 = [[UILabel alloc]initWithFrame:CGRectMake(5, yPos+195, 80, 40)];
    Namelbl3.text = @"Zip Code";
    Namelbl3.font = [UIFont boldSystemFontOfSize:13.0f];
    Namelbl3.textAlignment = NSTextAlignmentLeft;
    Namelbl3.textColor = [UIColor blackColor];
    [scroll addSubview:Namelbl3];
    
    pinCode = [[UITextField alloc]initWithFrame:CGRectMake(90, yPos+195,self.view.frame.size.width-100, 40)];
    pinCode.borderStyle = UITextBorderStyleBezel;
    pinCode.textAlignment = NSTextAlignmentCenter;
    pinCode.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [scroll addSubview:pinCode];
    pinCode.delegate = self;
    pinCode.tag= 103;
    pinCode.placeholder = @"Zip Code";
    //pinCode.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *Namelbl4 = [[UILabel alloc]initWithFrame:CGRectMake(5, yPos+250, 80, 20)];
    Namelbl4.text = @"Address";
    Namelbl4.font = [UIFont boldSystemFontOfSize:13.0f];
    Namelbl4.textAlignment = NSTextAlignmentLeft;
    Namelbl4.textColor = [UIColor blackColor];
    [scroll addSubview:Namelbl4];
    
    addressText = [[UITextView alloc]initWithFrame:CGRectMake(10, yPos+280, self.view.frame.size.width-20, 150)];
    [scroll addSubview:addressText];
    [addressText setDelegate:self];
    [addressText setReturnKeyType:UIReturnKeyDone];
    [addressText setTag:104];
    [addressText.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [addressText.layer setBorderWidth:2.0];
    //addressText.layer.cornerRadius = 5;
    
    UIButton *AcceptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    AcceptBtn.frame = CGRectMake(10, self.view.frame.size.height-120, 100, 44);
    AcceptBtn.tag = 500;
    [AcceptBtn setTitle:@"Order" forState:UIControlStateNormal];
    [AcceptBtn setBackgroundImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
    [AcceptBtn addTarget:self action:@selector(btnRemembar:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:AcceptBtn];
    
    UIButton *AcceptBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    AcceptBtn1.frame = CGRectMake(self.view.frame.size.width-110, self.view.frame.size.height-120, 100, 44);
    AcceptBtn1.tag = 501;
    [AcceptBtn1 setTitle:@"Cancel" forState:UIControlStateNormal];
    [AcceptBtn1 setBackgroundImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
    [AcceptBtn1 addTarget:self action:@selector(btnRemembar:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:AcceptBtn1];
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    
    nameTxt.inputAccessoryView = numberToolbar;
    emailTxt.inputAccessoryView = numberToolbar;
    phoneTxt.inputAccessoryView = numberToolbar;
    pinCode.inputAccessoryView = numberToolbar;
    addressText.inputAccessoryView = numberToolbar;
}

-(void)cancelNumberPad{
    [nameTxt resignFirstResponder];
    [phoneTxt resignFirstResponder];
    [emailTxt resignFirstResponder];
    [pinCode resignFirstResponder];
    [addressText resignFirstResponder];
    nameTxt.text = @"";
    emailTxt.text = @"";
    phoneTxt.text = @"";
    pinCode.text = @"";
    addressText.text = @"";
    
   [scroll setContentOffset:CGPointZero animated:YES];
}

-(void)doneWithNumberPad{
    [nameTxt resignFirstResponder];
    [emailTxt resignFirstResponder];
    [phoneTxt resignFirstResponder];
    [pinCode resignFirstResponder];
    [addressText resignFirstResponder];
    
}
-(void)btnRemembar:(UIButton *)sender
{
    if (sender.tag==500)
    {
        if(nameTxt.text == nil || [nameTxt.text isEqualToString:@""])
        {
            UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                 message:@"Enter your Name" delegate:nil
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil, nil];
            [ErrorAlert show];
        }
        
        else if(phoneTxt.text == nil || [phoneTxt.text isEqualToString:@""])
        {
            UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                 message:@"Enter your Phone Number" delegate:nil
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil, nil];
            [ErrorAlert show];        }
        else
        {
            
            MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
            
            mailer.mailComposeDelegate = self;
            
            [mailer setSubject:[NSString stringWithFormat:@"Mr/Mrs. %@",nameTxt.text]];
            
            NSArray *toRecipients = [NSArray arrayWithObjects:@"kishorrawat0001@gmail.com", nil];
            [mailer setToRecipients:toRecipients];
            
            
            
            NSString *emailBody =[NSString stringWithFormat:@"Name=%@\nEmail=%@\nPhone No=%@\nAddress=%@\nZip Code=%@",nameTxt.text,emailTxt.text,phoneTxt.text,pinCode.text,addressText.text];
            [mailer setMessageBody:emailBody isHTML:NO];
            
            NSData *myData = UIImagePNGRepresentation(finalImage);
            [mailer addAttachmentData:myData mimeType:@"image/png" fileName:@"photobrflag.png"];
            
            // Fill out the email body text
                       
            [self presentViewController:mailer animated:YES completion:NULL];
        }
        
 
    }
    
    if (sender.tag == 501)
    {
        [nameTxt resignFirstResponder];
        [phoneTxt resignFirstResponder];
        [emailTxt resignFirstResponder];
        [pinCode resignFirstResponder];
        
        nameTxt.text = @"";
        emailTxt.text = @"";
        phoneTxt.text = @"";
        pinCode.text = @"";
        addressText.text = @"";
   
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
        {
           
            UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@""
                                                                 message:@"Mail Cancele" delegate:nil
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil, nil];
            [ErrorAlert show];
        }
            break;
        case MFMailComposeResultSaved:
            
        {
            
            UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@""
                                                                 message:@"Mail Save" delegate:nil
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil, nil];
            [ErrorAlert show];
        }
            break;
        case MFMailComposeResultSent:
            
        {
            
            UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@""
                                                                 message:@"Mail Sent" delegate:nil
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil, nil];
            [ErrorAlert show];
        }
            
            break;
        case MFMailComposeResultFailed:
            
        {
            
            UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@""
                                                                 message:@"Mail Failed" delegate:nil
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil, nil];
            [ErrorAlert show];
        }
            
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//- (BOOL)textFieldShouldBeginEditing:(UITextField*)textField;
//{
//    NSInteger  currentSelectedTextField = textField.tag - 100;
//    
//    if(currentSelectedTextField>=2){
//        
//        [scroll setContentOffset:CGPointMake(0, (currentSelectedTextField-1)*30) animated:YES];
//    }
//    else
//    {
//        [scroll setContentOffset:CGPointZero animated:YES];
//    }
//    
//    
//    return YES;
//    
//}
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    
//    NSInteger  currentSelectedTextField = textField.tag - 99;
//    
//    if(currentSelectedTextField >= 1){
//        [scroll setContentOffset:CGPointZero animated:YES];
//    }
//    
//    [textField resignFirstResponder];
//    
//    return YES;
//}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    
    [theTextField resignFirstResponder];
    
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //hides keyboard when another part of layout was touched
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
