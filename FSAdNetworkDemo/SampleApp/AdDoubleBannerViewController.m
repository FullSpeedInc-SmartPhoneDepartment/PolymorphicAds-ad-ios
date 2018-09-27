//
//  AdDoubleBannerViewController.m
//  SampleApp
//
//  Created by RN-071 on 2016/05/27.
//  Copyright © 2016年 full Speed inc. All rights reserved.
//

#import "AdDoubleBannerViewController.h"
#import <FSAdNetwork/FSAdDoubleBannerView.h>

@interface AdDoubleBannerViewController ()
<FSAdDoubleBannerViewDelegate>

@property (weak, nonatomic) IBOutlet FSAdDoubleBannerView *adView;

@end

@implementation AdDoubleBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.adView.delegate = self;
    [self.adView initAd:AdDoubleBannerAdUnitId];
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
- (void)failedSendAdRequestFSAdDoubleBannerView:(FSAdDoubleBannerView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__, error.errorMessage);
    
}

- (void)finishInitAdFSAdDoubleBannerView:(FSAdDoubleBannerView *)sender {
    NSLog(@"%s", __func__);
    [self.adView loadAd];
}

- (void)failedInitAdFSAdDoubleBannerView:(FSAdDoubleBannerView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__, error.errorMessage);
}

- (void)failedResponseAdRequestFSAdDoubleBannerView:(FSAdDoubleBannerView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__, error.errorMessage);
}


@end
