//
//  FSAdDoubleBannerView.h
//  PolymorphicAds Double Size Banner
//
//  Double Banner unit class of PolymorphicAds
//  You need to call [initAd] or [initWithDelegate] to initialize unit.
//
//  Delegates called the following order:
//
//    initialization
//      - finishInitAdFSAdDoubleBannerView
//      - failedInitAdFSAdDoubleBannerView
//    -> sent request
//      - failedSendAdRequestFSAdDoubleBannerView
//    -> received response
//      - finishedResponseAdRequestFSAdDoubleBannerView
//      - failedResponseAdRequestFSAdDoubleBannerView
//      - emptyAdResponseAdRequestFSAdDoubleBannerView
//    -> unit creation
//      - finishedCreateFSAdDoubleBannerView
//      - failedCreateFSAdDoubleBannerView
//
//    ad will be diplayed!
//
//    -> clicked
//      - finishedAdClickFSAdDoubleBannerView
//      - failedAdClickFSAdDoubleBannerView
//
//
//  Created by RN-071 on 2016/05/27.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FSError.h"

@class FSAdDoubleBannerView;

@protocol FSAdDoubleBannerViewDelegate <NSObject>

@optional

//////////////
// delegate //
//////////////
/**
 initialization finished successfully
 */
- (void)finishInitAdFSAdDoubleBannerView:(FSAdDoubleBannerView *)sender;

/**
 failed to initalize ad unit
 */
- (void)failedInitAdFSAdDoubleBannerView:(FSAdDoubleBannerView *)sender error:(FSError *)error;

/**
 failed for send ad request
 */
- (void)failedSendAdRequestFSAdDoubleBannerView:(FSAdDoubleBannerView *)sender error:(FSError *)error;

/**
 received ad response successfully
 */
- (void)finishedResponseAdRequestFSAdDoubleBannerView:(FSAdDoubleBannerView *)sender;

/**
 failed to receive ad response
 */
- (void)failedResponseAdRequestFSAdDoubleBannerView:(FSAdDoubleBannerView *)sender error:(FSError *)error;

/**
 ad response was empty
 */
- (void)emptyAdResponseAdRequestFSAdDoubleBannerView:(FSAdDoubleBannerView *)sender;

/**
 finished to create ad view successfully
 */
- (void)finishedCreateFSAdDoubleBannerView:(FSAdDoubleBannerView *)sender ;

/**
 failed to create ad view
 */
- (void)failedCreateFSAdDoubleBannerView:(FSAdDoubleBannerView *)sender error:(FSError *)error;

/**
 succeeded to send ad click
 */
- (void)finishedAdClickFSAdDoubleBannerView:(FSAdDoubleBannerView *)adView;

/**
 failed to send ad click
 */
- (void)failedAdClickFSAdDoubleBannerView:(FSAdDoubleBannerView *)adView error:(FSError *)error;

@end

@interface FSAdDoubleBannerView : UIView

/// delegate
/// do NOT forget to detach when target instance deallocate!
@property (nonatomic, weak) id <FSAdDoubleBannerViewDelegate> delegate;

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
