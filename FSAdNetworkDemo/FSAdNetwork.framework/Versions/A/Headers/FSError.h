//
//  FSError.h
//  PolymorphicAds Error Class
//
//  Created by RN-079 on 2016/02/26.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/// error code type
typedef NS_ENUM(NSInteger, FS_ERRCD_TYPE) {
    FS_ERRCD_PARAM = 1,   // parameter error
    FS_ERRCD_RESPONSE,    // response error
    FS_ERRCD_NETWORK,     // network error
    FS_ERRCD_UNKNOWN      // unknown error
};

///// error message
#define FS_ERR_MSG_01 @"ad unit is not initialized or ad unit is not active"
#define FS_ERR_MSG_02 @"loading ad unit not executed"
#define FS_ERR_MSG_03 @"ad view is already created."
#define FS_ERR_MSG_04 @"already show"
#define FS_ERR_MSG_05 @"movie is not ready yet"
#define FS_ERR_MSG_06 @"failed to load movie"
#define FS_ERR_MSG_07 @"web unknown error"
#define FS_ERR_MSG_08 @"unknown error"
#define FS_ERR_MSG_09 @"incorrect banner size"
#define FS_ERR_MSG_10 @"incorrect carousel size"
#define FS_ERR_MSG_11 @"incorrect infeed size"
#define FS_ERR_MSG_12 @"no ad infomation"

@interface FSError : NSObject

/// error code
@property FS_ERRCD_TYPE errorCode;

/// error message
@property NSString *errorMessage;

/**
 create error object
 */
+ (id)errorCode:(FS_ERRCD_TYPE)errorCode errorMessage:(NSString *)errorMessage;
@end
