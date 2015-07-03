//
//  Constant.h
//  CaseByeMe
//
//  Created by Dextrotech on 12/06/15.
//  Copyright (c) 2015 Dextrotech Software Private Limited. All rights reserved.
//

#ifndef CaseByeMe_Constant_h
#define CaseByeMe_Constant_h

#define IS_IPHONE_4 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)480) < DBL_EPSILON)
#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)
#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)

#define kBaseURL @"https://instagram.com/"
#define kInstagramAPIBaseURL @"https://api.instagram.com"
#define KAUTHURL @"https://api.instagram.com/oauth/authorize/"
#define kAPIURl @"https://api.instagram.com/v1/users/"
#define KCLIENTID @"bb05cee16906455794cd3e784ccce745"
#define KCLIENTSERCRET @"0089e6b1891141c3afd5b9750649b681"
#define kREDIRECTURI @"http://yourcallback.com/callback"
#define kAuthenticationURL @"oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token&scope=likes+comments"  // comments
#define kClientID @"bb05cee16906455794cd3e784ccce745" // enter your client id obtained by registering your application on Instagram
#define kRedirectURI @"http://yourcallback.com/callback" // enter the redirect uri that you mentioned while registering the client on Instagram

#define kInstagramInfoUrl1  @"https://api.instagram.com/v1/users/"
#define kInstagramInfoUrl2  @"/media/recent?access_token="
#endif



