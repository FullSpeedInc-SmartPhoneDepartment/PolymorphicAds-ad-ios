//
//  FSAdPopupAdLoader.h
//  PolymorphicAds Popup
//
//  Popup unit class of PolymorphicAds
//  You need to call [initAd] to initialize unit.
//
//  Deleges called the following order:
//
//    initialization
//      - finishInitAdFSAdPopup
//      - failedInitAdFSAdPopup
//    -> sent request
//      - failedSendAdRequestFSAdPopup
//    -> received response
//      - finishedResponseAdRequestFSAdPopup
//      - failedResponseAdRequestFSAdPopup
//      - emptyAdResponseAdRequestFSAdPopup
//    -> unit creation
//      - finishedAdCreateFSAdPopup
//      - failedAdCreateFSAdPopup
//
//    now it's ready. call [showAd]!
//
//    -> clicked
//      - finishedAdClickFSAdPopup
//      - failedAdClickFSAdPopup
//
//    -> skipped
//      - skipAdCreateFSAdPopup
//
//    -> closed
//      - hideFSAdPopup
//
//
//  Created by RN-079 on 2015/12/07.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSError.h"

@class FSAdPopupAdLoader;

@protocol FSAdPopupAdLoaderDelegate <NSObject>

@optional

/**
 initialization finished successfully
 */
- (void)finishInitAdFSAdPopup:(FSAdPopupAdLoader *)sender;

/**
 initialization failed
 */
- (void)failedInitAdFSAdPopup:(FSAdPopupAdLoader *)sender error:(FSError *)error;

/**
 failed to send ad request
 */
- (void)failedSendAdRequestFSAdPopup:(FSAdPopupAdLoader *)sender error:(FSError *)error;

/**
 received ad response successfully
 */
- (void)finishedResponseAdRequestFSAdPopup:(FSAdPopupAdLoader *)sender;

/**
 failed to receive ad response
 */
- (void)failedResponseAdRequestFSAdPopup:(FSAdPopupAdLoader *)sender error:(FSError *)error;

/**
 ad response was empty
 */
- (void)emptyAdResponseAdRequestFSAdPopup:(FSAdPopupAdLoader *)sender;

/**
 finished to create ad view successfully
 */
- (void)finishedAdCreateFSAdPopup:(FSAdPopupAdLoader *)sender ;

/**
 failed to create ad view
 */
- (void)failedAdCreateFSAdPopup:(FSAdPopupAdLoader *)sender error:(FSError *)error;

/**
 succeeded to send ad click
 */
- (void)finishedAdClickFSAdPopup:(FSAdPopupAdLoader *)adView;

/**
 failed to send ad click
 */
- (void)failedAdClickFSAdPopup:(FSAdPopupAdLoader *)adView error:(FSError *)error;

/**
 skipped to create ad view
 */
- (void)skipAdCreateFSAdPopup:(FSAdPopupAdLoader *)adLoader;

/**
 hidden ad view
 */
- (void)hideFSAdPopup:(FSAdPopupAdLoader *)adLoader;


@end

@interface FSAdPopupAdLoader : NSObject

/// delegate
/// do NOT forget to detach when target instance deallocate!
@property (nonatomic, weak) id <FSAdPopupAdLoaderDelegate> delegate;


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




@end