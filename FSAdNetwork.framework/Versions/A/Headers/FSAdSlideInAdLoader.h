//
//  FSAdSlideInAdLoader.h
//  PolymorphicAds SlideIn
//
//  SlideIn unit class of PolymorphicAds
//  You need to call [initAd] to initialize unit.
//
//  Deleges called the following order:
//
//    initialization
//      - finishInitAdFSAdSlideIn
//      - failedInitAdFSAdSlideIn
//    -> sent request
//      - failedSendAdRequestFSAdSlideIn
//    -> received response
//      - finishedResponseAdRequestFSAdSlideIn
//      - failedResponseAdRequestFSAdSlideIn
//      - emptyAdResponseAdRequestFSAdSlideIn
//    -> unit creation
//      - finishedAdCreateFSAdSlideIn
//      - failedAdCreateFSAdSlideIn
//
//    now it's ready. call [showAd]!
//
//    -> clicked
//      - finishedAdClickFSAdSlideIn
//      - failedAdClickFSAdSlideIn
//
//    -> skipped
//      - skipAdCreateFSAdSlideIn
//
//    -> hidden
//      - hideFSAdSlideIn
//
//
//  Created by RN-079 on 2016/02/18.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FSError.h"

@class FSAdSlideInAdLoader;

@protocol FSAdSlideInAdLoaderDelegate <NSObject>

@optional

/**
 initialization finished successfully
 */
- (void)finishInitAdFSAdSlideIn:(FSAdSlideInAdLoader *)sender;

/**
 initialization failed
 */
- (void)failedInitAdFSAdSlideIn:(FSAdSlideInAdLoader *)sender error:(FSError *)error;

/**
 failed to send ad request
 */
- (void)failedSendAdRequestFSAdSlideIn:(FSAdSlideInAdLoader *)sender error:(FSError *)error;

/**
 received ad response successfully
 */
- (void)finishedResponseAdRequestFSAdSlideIn:(FSAdSlideInAdLoader *)sender;

/**
 failed to receive ad response
 */
- (void)failedResponseAdRequestFSAdSlideIn:(FSAdSlideInAdLoader *)sender error:(FSError *)error;

/**
 ad response was empty
 */
- (void)emptyAdResponseAdRequestFSAdSlideIn:(FSAdSlideInAdLoader *)sender;

/**
 finished to create ad view successfully
 */
- (void)finishedAdCreateFSAdSlideIn:(FSAdSlideInAdLoader *)sender ;

/**
 failed to create ad view
 */
- (void)failedAdCreateFSAdSlideIn:(FSAdSlideInAdLoader *)sender error:(FSError *)error;

/**
 succeeded to send ad click
 */
- (void)finishedAdClickFSAdSlideIn:(FSAdSlideInAdLoader *)adView;

/**
 failed to send ad click
 */
- (void)failedAdClickFSAdSlideIn:(FSAdSlideInAdLoader *)adView error:(FSError *)error;

/**
 skipped to create ad view
 */
- (void)skipAdCreateFSAdSlideIn:(FSAdSlideInAdLoader *)adLoader;

/**
 hidden ad view
 */
- (void)hideFSAdSlideIn:(FSAdSlideInAdLoader *)adLoader;

@end

@interface FSAdSlideInAdLoader : NSObject

/// delegate
/// do NOT forget to detach when target instance deallocate!
@property (nonatomic, weak) id <FSAdSlideInAdLoaderDelegate> delegate;


/**
 instance
 */
+ (instancetype)sharedInstance;

/**
 initialize ad
 @param adUnitId:ad unit identifier
 */
- (void)initAd:(NSString *)adUnitId;

/**
 initialize ad
 @param adUnitId : ad unit identifier
 @param intervalTime : ad display interval time(seconds)
 @param skipCount : ad display skip count
 @param displayTime : time displaying ad(seconds)
 
 you need to specify either or both of "intervalTime" and "skipCount" parameter to controll skipping.
 if both specified, skipCount will be handled first. put zero if you do not want to put specific value.
 set zero to ignore value. displayTime need to be more than 5(seconds) which means it will be ignored if you set less 5.
 
 */
- (void)initAd:(NSString *)adUnitId intervalTime:(NSInteger)intervalTime skipCount:(NSInteger)skipCount displayTime:(NSInteger)displayTime;

/**
 load ad
 @param adUnitId : ad unit identifier
 */
- (void)loadAd:(NSString *)adUnitId;

/**
 show ad view
 @param adUnitId : ad unit identifier
 
 You can't force new ad displayed during another(previous) ad displayed
 */
- (void)showAd:(NSString *)adUnitId ;

/**
 hide ad view manually
 */
- (void)hideAd;

@end
