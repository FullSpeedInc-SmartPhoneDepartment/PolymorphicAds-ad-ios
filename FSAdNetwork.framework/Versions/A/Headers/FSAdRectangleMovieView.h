//
//  FSAdRectangleMovieView.h
//  PolymorphicAds Rectangle Movie
//
//  Rectangle Movie unit class of PolymorphicAds
//  You need to call [initAd] to initialize unit.
//
//  Deleges called the following order:
//
//    initialization
//      - finishInitAdFSAdRectangleMovie
//      - failedInitAdFSAdRectangleMovie
//    -> sent request
//      - failedSendAdRequestFSAdRectangleMovie
//    -> received response
//      - finishedResponseAdRequestFSAdRectangleMovie
//      - failedResponseAdRequestFSAdRectangleMovie
//      - emptyAdResponseAdRequestFSAdRectangleMovie
//    -> load movie
//      * please consider it takes a little time to load movie
//      - finishedReadyMovieFSAdRectangleMovie
//      - failedReadyMovieFSAdRectangleMovie
//    -> unit creation
//      - finishedCreateFSAdRectangleMovie
//      - failedCreateFSAdRectangleMovie
//
//    call [showAd] to display it!
//
//    -> finish plaing
//      - completedMovieFSAdRectangleMovie
//
//    -> clicked
//      - finishedAdClickFSAdRectangleMovie
//      - failedAdClickFSAdRectangleMovie
//
//    -> closed
//      - hideAdViewFSAdRectangleMovie
//        * Please note that movie player closed when user tapped close button, NOT remove container view.
//
//
//
//  Created by RN-079 on 2016/03/23.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSError.h"

@class FSAdRectangleMovieView;

@protocol FSAdRectangleMovieViewDelegate <NSObject>

/**
 initialization finished successfully
 */
- (void)finishInitAdFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId;

/**
 initialization failed
 */
- (void)failedInitAdFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 failed to send ad request
 */
- (void)failedSendAdRequestFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 received ad response successfully
 */
- (void)finishedResponseAdRequestFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId;

/**
 failed to receive ad response
 */
- (void)failedResponseAdRequestFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 ad response was empty
 */
- (void)emptyAdResponseAdRequestFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId;

/**
 finished to load movie
 */
- (void)finishedReadyMovieFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId;

/**
 failed to load movie
 */
- (void)failedReadyMovieFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 finished to create ad view successfully
 */
- (void)finishedCreateFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId;

/**
 failed create ad view
 */
- (void)failedCreateFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 finished playing
 */
- (void)completedMovieFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId;

/**
 succeeded to send ad click
 */
- (void)finishedAdClickFSAdRectangleMovie:(FSAdRectangleMovieView *)adView adUnitId:(NSString *)adUnitId;

/**
 failed to send ad click
 */
- (void)failedAdClickFSAdRectangleMovie:(FSAdRectangleMovieView *)adView adUnitId:(NSString *)adUnitId error:(FSError *)error;

/**
 hidden ad view
 */
- (void)hideAdViewFSAdRectangleMovie:(FSAdRectangleMovieView *)adView adUnitId:(NSString *)adUnitId;


@end

@interface FSAdRectangleMovieView : UIView

/// delegate
/// do NOT forget to detach when target instance deallocate!
@property (nonatomic, weak) id <FSAdRectangleMovieViewDelegate> delegate;

/**
 initialize with delegate
 */
- (id)initWithDelegate:(id)delegate;

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
