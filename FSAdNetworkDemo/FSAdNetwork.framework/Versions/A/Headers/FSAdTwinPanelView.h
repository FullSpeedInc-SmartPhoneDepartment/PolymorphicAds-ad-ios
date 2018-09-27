//
//  FSAdTwinPanelView.h
//  PolymorphicAds Twin Panel
//
//  TwinPanel unit class of PolymorphicAds
//  You need to call [initAd] or [initWithDelegate] to initialize unit.
//
//  Delegates called the following order:
//
//    initialization
//      - finishInitAdFSAdTwinPanelView
//      - failedInitAdFSAdTwinPanelView
//    -> sent request
//      - failedSendAdRequestFSAdTwinPanelView
//    -> received response
//      - finishedResponseAdRequestFSAdTwinPanelView
//      - failedResponseAdRequestFSAdTwinPanelView
//      - emptyAdResponseAdRequestFSAdTwinPanelView
//    -> unit creation
//      - finishedCreateFSAdTwinPanelView
//      - failedCreateFSAdTwinPanelView
//
//    ad will be diplayed!
//
//    -> clicked
//      - finishedAdClickFSAdTwinPanelView
//      - failedAdClickFSAdTwinPanelView
//
//
//  Created by RN-071 on 2016/05/30.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FSError.h"


@class FSAdTwinPanelView;

@protocol FSAdTwinPanelViewDelegate <NSObject>

@optional

//////////////
// delegate //
//////////////
/**
 initialization finished successfully
 */
- (void)finishInitAdFSAdTwinPanelView:(FSAdTwinPanelView *)sender;

/**
 failed to initalize ad unit
 */
- (void)failedInitAdFSAdTwinPanelView:(FSAdTwinPanelView *)sender error:(FSError *)error;

/**
 failed for send ad request
 */
- (void)failedSendAdRequestFSAdTwinPanelView:(FSAdTwinPanelView *)sender error:(FSError *)error;

/**
 received ad response successfully
 */
- (void)finishedResponseAdRequestFSAdTwinPanelView:(FSAdTwinPanelView *)sender;

/**
 failed to receive ad response
 */
- (void)failedResponseAdRequestFSAdTwinPanelView:(FSAdTwinPanelView *)sender error:(FSError *)error;

/**
 ad response was empty
 */
- (void)emptyAdResponseAdRequestFSAdTwinPanelView:(FSAdTwinPanelView *)sender;

/**
 finished to create ad view successfully
 */
- (void)finishedCreateFSAdTwinPanelView:(FSAdTwinPanelView *)sender ;

/**
 failed to create ad view
 */
- (void)failedCreateFSAdTwinPanelView:(FSAdTwinPanelView *)sender error:(FSError *)error;

/**
 succeeded to send ad click
 */
- (void)finishedAdClickFSAdTwinPanelView:(FSAdTwinPanelView *)adView;

/**
 failed to send ad click
 */
- (void)failedAdClickFSAdTwinPanelView:(FSAdTwinPanelView *)adView error:(FSError *)error;

@end

@interface FSAdTwinPanelView : UIView

/// delegate
/// do NOT forget to detach when target instance deallocate!
@property (nonatomic, weak) id <FSAdTwinPanelViewDelegate> delegate;

// clicked ad index (Left: 0, Right: 1)
// please get only in delegate of click
@property (nonatomic, assign) NSInteger sourceIndex;

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
