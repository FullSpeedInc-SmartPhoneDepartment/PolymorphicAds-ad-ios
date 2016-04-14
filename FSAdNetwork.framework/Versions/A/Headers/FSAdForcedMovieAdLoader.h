//
//  FSAdForcedMovieAdLoader.h
//  PolymorphicAds Forced Movie
//
//  Forced Movie unit class of PolymorphicAds
//  You need to call [initAd] to initialize unit.
//
//  Deleges called the following order:
//
//    initialization
//      - finishInitAdFSAdForcedMovie
//      - failedInitAdFSAdForcedMovie
//    -> sent request
//      - failedSendAdRequestFSAdForcedMovie
//    -> received response
//      - finishedResponseAdRequestFSAdForcedMovie
//      - failedResponseAdRequestFSAdForcedMovie
//      - emptyAdResponseAdRequestFSAdForcedMovie
//    -> load movie
//      * please consider it takes a little time to load movie
//      - finishedReadyMovieFSAdForcedMovie
//      - failedReadyMovieFSAdForcedMovie
//    -> unit creation
//      - finishedCreateFSAdForcedMovie
//      - failedCreateFSAdForcedMovie
//
//    call [showAd] to display it!
//
//    -> finish plaing
//      - completedMovieFSAdForcedMovie
//
//    -> clicked
//      - finishedAdClickFSAdForcedMovie
//      - failedAdClickFSAdForcedMovie
//
//    -> closed
//      - hideAdViewFSAdForcedMovie
//
//
//  Created by RN-079 on 2015/12/24.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSError.h"

@class FSAdForcedMovieAdLoader;

@protocol FSAdForcedMovieAdLoaderDelegate <NSObject>

@optional

/**
 initialization finished successfully
 */
- (void)finishInitAdFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId;

/**
 initialization failed
 */
- (void)failedInitAdFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 failed to send ad request
 */
- (void)failedSendAdRequestFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 received ad response successfully
 */
- (void)finishedResponseAdRequestFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId;

/**
 failed to receive ad response
 */
- (void)failedResponseAdRequestFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 ad response was empty
 */
- (void)emptyAdResponseAdRequestFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId;

/**
 finished to load movie
 */
- (void)finishedReadyMovieFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId;

/**
 failed to load movie
 */
- (void)failedReadyMovieFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 finished to create ad view successfully
 */
- (void)finishedCreateFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId;

/**
 failed to create ad view
 */
- (void)failedCreateFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 finished playing
 */
- (void)completedMovieFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId;

/**
 succeeded to send ad click
 */
- (void)finishedAdClickFSAdForcedMovie:(FSAdForcedMovieAdLoader *)adView adUnitId:(NSString *)adUnitId;

/**
 failed to send ad click
 */
- (void)failedAdClickFSAdForcedMovie:(FSAdForcedMovieAdLoader *)adView adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 hidden ad view
 */
- (void)hideAdViewFSAdForcedMovie:(FSAdForcedMovieAdLoader *)adView adUnitId:(NSString *)adUnitId;

@end


@interface FSAdForcedMovieAdLoader : NSObject

/// delegate
/// do NOT forget to detach when target instance deallocate!
@property (nonatomic, weak) id <FSAdForcedMovieAdLoaderDelegate> delegate;


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
 load ad information & create ad view
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
