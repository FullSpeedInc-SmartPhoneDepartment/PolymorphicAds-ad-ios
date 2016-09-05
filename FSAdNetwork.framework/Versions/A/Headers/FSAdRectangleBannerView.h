//
//  FSAdRectangleBannerView.h
//  PolymorphicAds Double Size Banner
//
//  Double Banner unit class of PolymorphicAds
//  You need to call [initAd] or [initWithDelegate] to initialize unit.
//
//  Delegates called the following order:
//
//    initialization
//      - finishInitAdFSAdRectangleBannerView
//      - failedInitAdFSAdRectangleBannerView
//    -> sent request
//      - failedSendAdRequestFSAdRectangleBannerView
//    -> received response
//      - finishedResponseAdRequestFSAdRectangleBannerView
//      - failedResponseAdRequestFSAdRectangleBannerView
//      - emptyAdResponseAdRequestFSAdRectangleBannerView
//    -> unit creation
//      - finishedCreateFSAdRectangleBannerView
//      - failedCreateFSAdRectangleBannerView
//
//    ad will be diplayed!
//
//    -> clicked
//      - finishedAdClickFSAdRectangleBannerView
//      - failedAdClickFSAdRectangleBannerView
//
//
//  Created by RN-071 on 2016/05/27.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FSError.h"

@class FSAdRectangleBannerView;

@protocol FSAdRectangleBannerViewDelegate <NSObject>

@optional

//////////////
// delegate //
//////////////
/**
 initialization finished successfully
 */
- (void)finishInitAdFSAdRectangleBannerView:(FSAdRectangleBannerView *)sender;

/**
 failed to initalize ad unit
 */
- (void)failedInitAdFSAdRectangleBannerView:(FSAdRectangleBannerView *)sender error:(FSError *)error;

/**
 failed for send ad request
 */
- (void)failedSendAdRequestFSAdRectangleBannerView:(FSAdRectangleBannerView *)sender error:(FSError *)error;

/**
 received ad response successfully
 */
- (void)finishedResponseAdRequestFSAdRectangleBannerView:(FSAdRectangleBannerView *)sender;

/**
 failed to receive ad response
 */
- (void)failedResponseAdRequestFSAdRectangleBannerView:(FSAdRectangleBannerView *)sender error:(FSError *)error;

/**
 ad response was empty
 */
- (void)emptyAdResponseAdRequestFSAdRectangleBannerView:(FSAdRectangleBannerView *)sender;

/**
 finished to create ad view successfully
 */
- (void)finishedCreateFSAdRectangleBannerView:(FSAdRectangleBannerView *)sender ;

/**
 failed to create ad view
 */
- (void)failedCreateFSAdRectangleBannerView:(FSAdRectangleBannerView *)sender error:(FSError *)error;

/**
 succeeded to send ad click
 */
- (void)finishedAdClickFSAdRectangleBannerView:(FSAdRectangleBannerView *)adView;

/**
 failed to send ad click
 */
- (void)failedAdClickFSAdRectangleBannerView:(FSAdRectangleBannerView *)adView error:(FSError *)error;

@end

@interface FSAdRectangleBannerView : UIView

/// delegate
/// do NOT forget to detach when target instance deallocate!
@property (nonatomic, weak) id <FSAdRectangleBannerViewDelegate> delegate;

/**
 initialize with delegate
 */
- (id)initWithDelegate:(id)delegate;

/**
 initialize
 @param adUnitId : ad unit identifier
 */
- (void)initAd:(NSString *)adUnitId;

/**
 load and show ad view.
 */
- (void)loadAd ;

/**
 pause reload timer
 */
- (void)pause ;

/**
 resume reload timer
 */
- (void)resume ;


@end
