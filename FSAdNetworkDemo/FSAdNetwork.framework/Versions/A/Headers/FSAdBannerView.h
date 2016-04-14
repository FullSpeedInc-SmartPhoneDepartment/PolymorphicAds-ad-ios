//
//  FSAdBannerView.h
//  PolymorphicAds Banner
//
//  Banner unit class of PolymorphicAds
//  You need to call [initAd] or [initWithDelegate] to initialize unit.
//
//  Deleges called the following order:
//
//    initialization
//      - finishInitAdFSAdBannerView
//      - failedInitAdFSAdBannerView
//    -> sent request
//      - failedSendAdRequestFSAdBannerView
//    -> received response
//      - finishedResponseAdRequestFSAdBannerView
//      - failedResponseAdRequestFSAdBannerView
//      - emptyAdResponseAdRequestFSAdBannerView
//    -> unit creation
//      - finishedCreateFSAdBannerView
//      - failedCreateFSAdBannerView
//
//    ad will be diplayed!
//
//    -> clicked
//      - finishedAdClickFSAdBannerView
//      - failedAdClickFSAdBannerView
//
//
//  Created by RN-079 on 2015/12/04.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FSError.h"

@class FSAdBannerView;

@protocol FSAdBannerViewDelegate <NSObject>

@optional

//////////////
// delegate //
//////////////
/**
 initialization finished successfully
 */
- (void)finishInitAdFSAdBannerView:(FSAdBannerView *)sender;

/**
 failed to initalize ad unit
 */
- (void)failedInitAdFSAdBannerView:(FSAdBannerView *)sender error:(FSError *)error;

/**
 failed for send ad request
 */
- (void)failedSendAdRequestFSAdBannerView:(FSAdBannerView *)sender error:(FSError *)error;

/**
 received ad response successfully
 */
- (void)finishedResponseAdRequestFSAdBannerView:(FSAdBannerView *)sender;

/**
 failed to receive ad response
 */
- (void)failedResponseAdRequestFSAdBannerView:(FSAdBannerView *)sender error:(FSError *)error;

/**
 ad response was empty
 */
- (void)emptyAdResponseAdRequestFSAdBannerView:(FSAdBannerView *)sender;

/**
 finished to create ad view successfully
 */
- (void)finishedCreateFSAdBannerView:(FSAdBannerView *)sender ;

/**
 failed to create ad view
 */
- (void)failedCreateFSAdBannerView:(FSAdBannerView *)sender error:(FSError *)error;

/**
 succeeded to send ad click
 */
- (void)finishedAdClickFSAdBannerView:(FSAdBannerView *)adView;

/**
 failed to send ad click
 */
- (void)failedAdClickFSAdBannerView:(FSAdBannerView *)adView error:(FSError *)error;

@end

@interface FSAdBannerView : UIView

/// delegate
/// do NOT forget to detach when target instance deallocate!
@property (nonatomic, weak) id <FSAdBannerViewDelegate> delegate;

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
