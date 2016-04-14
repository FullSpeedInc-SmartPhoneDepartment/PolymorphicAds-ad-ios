//
//  FSAdInterstitialAdLoader.h
//  PolymorphicAds Interstitial
//
//  Interstitial unit class of PolymorphicAds
//  You need to call [initAd] to initialize unit.
//
//  Deleges called the following order:
//
//    initialization
//      - finishInitAdFSAdInterstitial
//      - failedInitAdFSAdInterstitial
//    -> sent request
//      - failedSendAdRequestFSAdInterstitial
//    -> received response
//      - finishedResponseAdRequestFSAdInterstitial
//      - failedResponseAdRequestFSAdInterstitial
//      - emptyAdResponseAdRequestFSAdInterstitial
//    -> unit creation
//      - finishedAdCreateFSAdInterstitial
//      - failedAdCreateFSAdInterstitial
//
//    now it's ready. call [showAd]!
//
//    -> clicked
//      - finishedAdClickFSAdInterstitial
//      - failedAdClickFSAdInterstitial
//
//    -> skipped
//      - skipAdCreateFSAdInterstitial
//
//    -> closed by close button
//      - hideFSAdInterstitial
//
//
//  Created by RN-079 on 2015/12/04.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FSError.h"

@class FSAdInterstitialAdLoader;

@protocol FSAdInterstitialAdLoaderDelegate <NSObject>

@optional

/**
 initialization finished successfully
 */
- (void)finishInitAdFSAdInterstitial:(FSAdInterstitialAdLoader *)sender;

/**
 initialization failed
 */
- (void)failedInitAdFSAdInterstitial:(FSAdInterstitialAdLoader *)sender error:(FSError *)error;

/**
 failed to send ad request
 */
- (void)failedSendAdRequestFSAdInterstitial:(FSAdInterstitialAdLoader *)sender error:(FSError *)error;

/**
 received ad response successfully
 */
- (void)finishedResponseAdRequestFSAdInterstitial:(FSAdInterstitialAdLoader *)sender;

/**
 failed to receive ad response
 */
- (void)failedResponseAdRequestFSAdInterstitial:(FSAdInterstitialAdLoader *)sender error:(FSError *)error;

/**
 ad response was empty
 */
- (void)emptyAdResponseAdRequestFSAdInterstitial:(FSAdInterstitialAdLoader *)sender;

/**
 finished to create ad view successfully
 */
- (void)finishedAdCreateFSAdInterstitial:(FSAdInterstitialAdLoader *)sender ;

/**
 failed to create ad view
 */
- (void)failedAdCreateFSAdInterstitial:(FSAdInterstitialAdLoader *)sender error:(FSError *)error;

/**
 succeeded to send ad click
 */
- (void)finishedAdClickFSAdInterstitial:(FSAdInterstitialAdLoader *)adView;

/**
 failed to send ad click
 */
- (void)failedAdClickFSAdInterstitial:(FSAdInterstitialAdLoader *)adView error:(FSError *)error;

/**
 skipped create ad view
 */
- (void)skipAdCreateFSAdInterstitial:(FSAdInterstitialAdLoader *)adLoader;

/**
 hidden ad view
 */
- (void)hideFSAdInterstitial:(FSAdInterstitialAdLoader *)adLoader;

@end

@interface FSAdInterstitialAdLoader : NSObject

/// delegate
/// do NOT forget to detach when target instance deallocate!
@property (nonatomic, weak) id <FSAdInterstitialAdLoaderDelegate> delegate;


/**
 shared instance
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
 
 you need to specify either or both parameter to controll skipping.
 if both specified, skipCount will be handled first. put zero if you do not want to put specific value.
 to put zero both parameters means ad unit will show up everytime [showAd] called.
 */
- (void)initAd:(NSString *)adUnitId intervalTime:(NSInteger)intervalTime skipCount:(NSInteger)skipCount;

/**
 load ad
 @param adUnitId : ad unit identifier
 */
- (void)loadAd:(NSString *)adUnitId;

/**
 show ad view
 @param adUnitId : ad unit identifier
 */
- (void)showAd:(NSString *)adUnitId ;

/**
 hide ad view manually
 */
- (void)hideAd;

/**
 returns if ad view is ready
 */
- (BOOL)isReadyAd:(NSString *)adUnitId;


@end
