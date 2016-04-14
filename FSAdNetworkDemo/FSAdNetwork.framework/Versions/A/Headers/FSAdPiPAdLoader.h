//
//  FSAdPiPAdLoader.h
//  PolymorphicAds Expandable Movie
//
//  Expandable Movie unit class of PolymorphicAds
//  You need to call [initAd] to initialize unit.
//
//  Deleges called the following order:
//
//    initialization
//      - finishInitAdFSAdPiP
//      - failedInitAdFSAdPiP
//    -> sent request
//      - failedSendAdRequestFSAdPiP
//    -> received response
//      - finishedResponseAdRequestFSAdPiP
//      - failedResponseAdRequestFSAdPiP
//      - emptyAdResponseAdRequestFSAdPiP
//    -> load movie
//      * please consider it takes a little time to load movie
//      - finishedReadyMovieFSAdPiP
//      - failedReadyMovieFSAdPiP
//    -> unit creation
//      - finishedReadyMovieFSAdPiP
//      - failedCreateFSAdPiP
//
//    call [showAd] to display it!
//
//    -> finish plaing
//      - completedMovieFSAdPiP
//
//    -> clicked
//      - finishedAdClickFSAdPiP
//      - failedAdClickFSAdPiP
//
//    -> closed
//      - hideAdViewFSAdPiP
//
//  Created by RN-079 on 2015/12/22.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSError.h"

/**
 
 You can set position movie container appears
 
 FSAdPiPPositionTypeLeftTop: container appears on top left of screen
 FSAdPiPPositionTypeRightTop: container appears on top right of screen
 FSAdPiPPositionTypeLeftBottom: container appears on bottom left of screen
 FSAdPiPPositionTypeRightBottom: container appears on bottom right of screen
 
 if you want container to appear other position, you can arrange it by setting posBottom and posTrailing properties
 
 */
typedef NS_ENUM(NSInteger, FSAdPiPPositionType) {
    FSAdPiPPositionTypeLeftTop,
    FSAdPiPPositionTypeRightTop,
    FSAdPiPPositionTypeLeftBottom,
    FSAdPiPPositionTypeRightBottom
};


@class FSAdPiPAdLoader;

@protocol FSAdPiPAdLoaderDelegate <NSObject>

@optional

/**
 initialization finished successfully
 */
- (void)finishInitAdFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId;

/**
 initialization failed
 */
- (void)failedInitAdFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 failed to send ad request
 */
- (void)failedSendAdRequestFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 received ad response successfully
 */
- (void)finishedResponseAdRequestFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId;

/**
 failed to receive ad response
 */
- (void)failedResponseAdRequestFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 ad response was empty
 */
- (void)emptyAdResponseAdRequestFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId;

/**
  finished to load movie
 */
- (void)finishedReadyMovieFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId;

/**
 failed to load movie
 */
- (void)failedReadyMovieFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 finished to create ad view successfully
 */
- (void)finishedCreateFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId;

/**
 failed create ad view
 */
- (void)failedCreateFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 finished playing
 */
- (void)completedMovieFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId;

/**
 succeeded to send ad click
 */
- (void)finishedAdClickFSAdPiP:(FSAdPiPAdLoader *)adView adUnitId:(NSString *)adUnitId;

/**
 failed to send ad click
 */
- (void)failedAdClickFSAdPiP:(FSAdPiPAdLoader *)adView adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 hidden ad view
 */
- (void)hideAdViewFSAdPiP:(FSAdPiPAdLoader *)adView adUnitId:(NSString *)adUnitId;

@end


@interface FSAdPiPAdLoader : NSObject

/// delegate
/// do NOT forget to detach when target instance deallocate!
@property (nonatomic, weak) id <FSAdPiPAdLoaderDelegate> delegate;

/// position from bottom edge of screen
@property (nonatomic, assign) float_t posBottom;

/// position from right edge of screen
@property (nonatomic, assign) float_t posTrailing;


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
 load ad & create ad view
 @param adUnitId : ad unit identifier
 
 You can call this instead of calling [loadAd] and [createAd]
 */
- (void)loadAndCreateAd:(NSString *)adUnitId;

/**
 load ad
 @param adUnitId : ad unit identifier
 */
- (void)loadAd:(NSString *)adUnitId;

/**
 create ad view
 @param adUnitId : ad unit identifier
 */
- (void)createAd:(NSString *)adUnitId;

/**
 show ad view
 @param adUnitId : ad unit identifier
 */
- (BOOL)showAd:(NSString *)adUnitId;

/**
 show ad view
 @param adUnitId : ad unit identifier
 @param positionType : position type
 
 if you do not want to use declared positionType, you need to set position property before call this
 */
- (BOOL)showAd:(NSString *)adUnitId position:(FSAdPiPPositionType)positionType;

/**
 hide ad view
 @param adUnitId : ad unit identifier
 */
- (void)hideAd:(NSString *)adUnitId;

/**
 returns if ad view is ready
 @param adUnitId : ad unit identifier
 */
- (BOOL)isReadyAd:(NSString *)adUnitId;

/**
 returns if ad view is displayed
 @param adUnitId : ad unit identifier
 */
- (BOOL)isDisplayAd:(NSString *)adUnitId;

@end
