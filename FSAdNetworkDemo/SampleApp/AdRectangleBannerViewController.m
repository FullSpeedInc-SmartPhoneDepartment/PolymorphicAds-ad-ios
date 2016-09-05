//
//  AdRectangleBannerViewController.m
//  SampleApp
//
//  Created by RN-079 on 2016/07/28.
//  Copyright © 2016年 full Speed inc. All rights reserved.
//

#import "AdRectangleBannerViewController.h"
#import <FSAdNetwork/FSAdRectangleBannerView.h>


@interface AdRectangleBannerViewController () <FSAdRectangleBannerViewDelegate>

@property (weak, nonatomic) IBOutlet FSAdRectangleBannerView *adView;

@end


@implementation AdRectangleBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.adView.delegate = self;
    [self.adView initAd:AdRectangleBannerAdUnitId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
- (void)failedSendAdRequestFSAdRectangleBannerView:(FSAdRectangleBannerView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__, error.errorMessage);
    
}

- (void)finishInitAdFSAdRectangleBannerView:(FSAdRectangleBannerView *)sender {
    NSLog(@"%s", __func__);
    [self.adView loadAd];
}

- (void)failedInitAdFSAdRectangleBannerView:(FSAdRectangleBannerView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__, error.errorMessage);
}

- (void)failedResponseAdRequestFSAdRectangleBannerView:(FSAdRectangleBannerView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__, error.errorMessage);
}

@end
