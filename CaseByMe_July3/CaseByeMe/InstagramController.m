//
//  InstagramController.m
//  CaseByeMe
//
//  Created by Dextrotech on 29/06/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#import "InstagramController.h"
#import "Constant.h"
@interface InstagramController () <UIWebViewDelegate>
{
    UIWebView* mywebview;
    NSString *tokenAccess;
}

@end

@implementation InstagramController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadURL];
}
-(void)loadURL
{
    
    NSString* urlString = [kBaseURL stringByAppendingFormat:kAuthenticationURL,kClientID,kRedirectURI];
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    mywebview = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [mywebview sizeToFit];
    mywebview.scrollView.scrollEnabled = YES;
    [mywebview loadRequest:request];
    mywebview.delegate = self;
    [self.view addSubview:mywebview];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString* urlString = [[request URL] absoluteString];
    NSLog(@"URL STRING : %@ ",urlString);
    NSArray *UrlParts = [urlString componentsSeparatedByString:[NSString stringWithFormat:@"%@/", kREDIRECTURI]];
     NSLog(@"URL = : %@ ",UrlParts);
    if ([UrlParts count] > 1) {
        // do any of the following here
        urlString = [UrlParts objectAtIndex:1];
        NSRange accessToken = [urlString rangeOfString: @"#access_token="];
        if (accessToken.location != NSNotFound) {
           tokenAccess = [urlString substringFromIndex: NSMaxRange(accessToken)];
            // Save access token to user defaults for later use.
            // Add contant key #define KACCESS_TOKEN @”access_token” in contant //class [[NSUserDefaults standardUserDefaults] setValue:strAccessToken forKey: KACCESS_TOKEN]; [[NSUserDefaults standardUserDefaults] synchronize];
            //NSLog(@"AccessToken = %@ ",strAccessToken);
            [self loadRequestForMediaData];
        }
        return NO;
    }
    return YES;
}
-(void)loadRequestForMediaData {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@users/3/media/recent/?access_token=%@",kAPIURl,[[ NSUserDefaults standardUserDefaults]
                                                                                                                                                     valueForKey:tokenAccess]]]];
    // Here you can handle response as well
    NSDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"Response : %@",dictResponse); 
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
