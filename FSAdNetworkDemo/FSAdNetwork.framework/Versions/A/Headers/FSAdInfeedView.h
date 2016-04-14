//
//  FSAdInfeedView.h
//  PolymorphicAds Infeed
//
//  Infeed unit class of PolymorphicAds
//  You need to call [loadAdWithSize] with specifying container size to initialize unit.
//
//
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!! * IMPORTANT * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
// *Please note that infeed size and image size are arrangeable, but there are some instructions.
//
// - Infeed container height should be set over 80px. If you want to set less height,
//   we recommend you to set style FSInfeedTypeTextOnly because of collapse of image layout.
//
// - Image size should be set over 80px and for sure less than infeed height.
//
// *If we find layout collapsed, we can stop sending ad to your unit.
//  You need to arrange layout on your own responsibility.
//
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
//
//  Deleges called the following order:
//
//    initialization
//      - finishInitAdFSAdInfeedView
//      - failedInitAdFSAdInfeedView
//    -> sent request
//      - failedSendAdRequestFSAdInfeedView
//    -> received response
//      - finishedResponseAdRequestFSAdInfeedView
//      - failedResponseAdRequestFSAdInfeedView
//      - emptyAdResponseAdRequestFSAdInfeedView
//    -> unit creation
//      - finishedCreateFSAdInfeedView
//      - failedCreateFSAdInfeedView
//
//    infeed will show up!
//
//    -> clicked
//      - finishedAdClickFSAdInfeedView
//      - failedAdClickFSAdInfeedView
//
//
//  Created by RN-079 on 2016/02/26.
//  Copyright © 2016 fullSpeed inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSError.h"

/**
 You can customize layout by specifying FSInfeedType
 
 FSInfeedTypeLeftAd: icon image will be embeded on the LEFT of container
 ====================================
 |                                  |
 | --------  Title                  |
 | | icon |                         |
 | --------  Body                   |
 |                                  |
 ====================================
 
 FSInfeedTypeRightAd: icon image will be embeded on the RIGHT of container
 ====================================
 |                                  |
 | Title                  --------  |
 |                        | icon |  |
 | Body                   --------  |
 |                                  |
 ====================================
 
 FSInfeedTypeTextOnly: container includes text only
 ====================================
 |                                  |
 | Title                            |
 |                                  |
 | Body                             |
 |                                  |
 ====================================
 
 
 *Please note that infeed size and image size are arrangeable, but there are some instructions.
 
  - Infeed container height should be set over 80px. If you want to set less height,
    we recommend you to set style FSInfeedTypeTextOnly because of collapse of image layout.
 
  - Image size should be set over 80px and for sure less than infeed height.
    
 *If we find layout collapsed, we can stop sending ad to your unit.
  You need to arrange layout on your own responsibility.
 
*/
typedef NS_ENUM(NSInteger, FSInfeedType) {
    FSInfeedTypeTextOnly    = 0,
    FSInfeedTypeLeftAd      = 1,
    FSInfeedTypeRightAd     = 2
};

typedef NS_ENUM(NSInteger, FSInfeedImagePos) {
    FSInfeedImagePosTop     = 0,
    FSInfeedImagePosMiddle  = 1,
    FSInfeedImagePosBottom  = 2
};

@class FSAdInfeedView;

@protocol FSAdInfeedViewDelegate <NSObject>

@optional

/**
 initialization finished successfully
 */
- (void)finishInitAdFSAdInfeedView:(FSAdInfeedView *)sender;

/**
 initialization failed
 */
- (void)failedInitAdFSAdInfeedView:(FSAdInfeedView *)sender error:(FSError *)error;

/**
 failed to send ad request
 */
- (void)failedSendAdRequestFSAdInfeedView:(FSAdInfeedView *)sender error:(FSError *)error;

/**
 received ad response successfully
 */
- (void)finishedResponseAdRequestFSAdInfeedView:(FSAdInfeedView *)sender;

/**
 failed to receive ad response
 */
- (void)failedResponseAdRequestFSAdInfeedView:(FSAdInfeedView *)sender error:(FSError *)error;

/**
 ad response was empty
 */
- (void)emptyAdResponseAdRequestFSAdInfeedView:(FSAdInfeedView *)sender;

/**
 finished to create ad view successfully
 */
- (void)finishedCreateFSAdInfeedView:(FSAdInfeedView *)sender ;

/**
 failed to create ad view
 */
- (void)failedCreateFSAdInfeedView:(FSAdInfeedView *)sender error:(FSError *)error;

/**
 succeeded to send ad click
 */
- (void)finishedAdClickFSAdInfeedView:(FSAdInfeedView *)adView;

/**
 failed to send ad click
 */
- (void)failedAdClickFSAdInfeedView:(FSAdInfeedView *)adView error:(FSError *)error;


@end

@interface FSAdInfeedView : UIView

/// delegate
/// do NOT forget to detach when target instance deallocate!
@property (nonatomic, weak) id <FSAdInfeedViewDelegate> delegate;

/// Infeed type
@property (nonatomic, assign) FSInfeedType infeedType;

/// image height (58px - 160px)
@property (nonatomic, assign) CGFloat imageHeight;

/// image position (top, middle, bottom)
@property (nonatomic, assign) FSInfeedImagePos imagePosision;


/**
 initialize ad
 @param adUnitId:ad unit identifier
 */
- (void)initAd:(NSString *)adUnitId;

/**
 (Deprecated) load ad
 
 This method is deprecated. Remain for previous version.
 Please call loadAdWithSize instead.
 */
- (void)loadAd;

/**
 load ad with cell size
 */
- (void)loadAdWithSize:(CGSize)size;


@end
