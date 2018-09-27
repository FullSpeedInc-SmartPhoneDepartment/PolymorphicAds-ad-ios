//
//  FSAdAnalytics.h
//  PolymorphicAnalytics
//
//  Analytics Class of PolymorphicAds
//
//  please make sure the conversion you want to collect is set ON in its status on PolymorphicAds Web Management Tool
//
//
//  Created by RN-079 on 2016/01/21.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FSAdAnalyticsDelegate <NSObject>

/**
 sent conversion successfully
 */
- (void)finishedConversionFSAdAnalytics;

/**
 failed to send conversion
 */
- (void)failedConversionFSAdAnalytics;

@end

@interface FSAdAnalytics : NSObject

@property (nonatomic, assign) id delegate;

/**
 send conversion with conversionId
 
 you need to copy conversion id from PolymorphicAds Web Management Tool
 */
- (void)conversion:(NSString *)conversionId ;


@end
