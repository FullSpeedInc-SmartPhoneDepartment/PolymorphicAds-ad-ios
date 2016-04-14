//
//  FSAdCarouselView.h
//  PolymorphicAds Carousel
//
//  Carousel unit class of PolymorphicAds
//  You need to call [initAd] to initialize unit.
//
//  Deleges called the following order:
//
//    initialization
//      - finishInitAdFSAdCarouselView
//      - failedInitAdFSAdCarouselView
//    -> sent request
//      - failedSendAdRequestFSAdCarouselView
//    -> received response
//      - finishedResponseAdRequestFSAdCarouselView
//      - failedResponseAdRequestFSAdCarouselView
//      - emptyAdResponseAdRequestFSAdCarouselView
//    -> unit creation
//      - finishedCreateFSAdCarouselView
//      - failedCreateFSAdCarouselView
//
//    now it's ready. carousel will show up!
//
//    -> clicked
//      - finishedAdClickFSAdCarouselView
//      - failedAdClickFSAdCarouselView
//
//
//  Created by RN-079 on 2015/12/08.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSError.h"

@class FSAdCarouselView;

@protocol FSAdCarouselViewDelegate <NSObject>

@optional

/**
 initialization finished successfully
 */
- (void)finishInitAdFSAdCarouselView:(FSAdCarouselView *)sender;

/**
 initialization failed
 */
- (void)failedInitAdFSAdCarouselView:(FSAdCarouselView *)sender error:(FSError *)error;

/**
 failed to send ad request
 */
- (void)failedSendAdRequestFSAdCarouselView:(FSAdCarouselView *)sender error:(FSError *)error;

/**
 received ad response successfully
 */
- (void)finishedResponseAdRequestFSAdCarouselView:(FSAdCarouselView *)sender;

/**
 failed to receive ad response
 */
- (void)failedResponseAdRequestFSAdCarouselView:(FSAdCarouselView *)sender error:(FSError *)error;

/**
 ad response was empty
 */
- (void)emptyAdResponseAdRequestFSAdCarouselView:(FSAdCarouselView *)sender;

/**
 finished to create ad view successfully
 */
- (void)finishedCreateFSAdCarouselView:(FSAdCarouselView *)sender ;

/**
 failed to create ad view
 */
- (void)failedCreateFSAdCarouselView:(FSAdCarouselView *)sender error:(FSError *)error;

/**
 succeeded to send ad click
 */
- (void)finishedAdClickFSAdCarouselView:(FSAdCarouselView *)adView;

/**
 failed to send ad click
 */
- (void)failedAdClickFSAdCarouselView:(FSAdCarouselView *)adView error:(FSError *)error;


@end

@interface FSAdCarouselView : UIView

/// delegate
/// do NOT forget to detach when target instance deallocate!
@property (nonatomic, weak) id <FSAdCarouselViewDelegate> delegate;


/**
 initialize ad
 @param adUnitId:ad unit identifier
 */
- (void)initAd:(NSString *)adUnitId;

/**
 load ad
 @param adUnitId : ad unit identifier
 */
- (void)loadAd:(NSString *)adUnitId ;

@end
