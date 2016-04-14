//
//  AdBannerViewController.m
//  SampleApp
//
//  Created by RN-079 on 2015/12/03.
//  Copyright © 2015年 full Speed inc. All rights reserved.
//

#import "AdBannerViewController.h"
#import <FSAdNetwork/FSAdBannerView.h>

//#define AD_UNIT_ID @"03000800406001050001"

@interface AdBannerViewController ()
<FSAdBannerViewDelegate>
@property (nonatomic, weak) IBOutlet FSAdBannerView *adView;

@end

@implementation AdBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)viewDidAppear:(BOOL)animated {
    
    self.adView.delegate = self;
    [self.adView initAd:AdBannerAdUnitId];
}

- (void)viewDidDisappear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 
- (void)failedSendAdRequestFSAdBannerView:(FSAdBannerView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__, error.errorMessage);
    
}

- (void)finishInitAdFSAdBannerView:(FSAdBannerView *)sender {
    NSLog(@"%s", __func__);
    [self.adView loadAd];
}

- (void)failedInitAdFSAdBannerView:(FSAdBannerView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__, error.errorMessage);
}

- (void)failedResponseAdRequestFSAdBannerView:(FSAdBannerView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__, error.errorMessage);
}
@end
