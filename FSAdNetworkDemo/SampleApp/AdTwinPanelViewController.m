//
//  AdTwinPanelViewController.m
//  SampleApp
//
//  Created by RN-071 on 2016/05/30.
//  Copyright © 2016年 full Speed inc. All rights reserved.
//

#import "AdTwinPanelViewController.h"
#import <FSAdNetwork/FSAdTwinPanelView.h>

@interface AdTwinPanelViewController()
<FSAdTwinPanelViewDelegate>

@property (weak, nonatomic) IBOutlet FSAdTwinPanelView *adView;


@end

@implementation AdTwinPanelViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.adView.delegate = self;
    [self.adView initAd:AdTwinPanelAdUnitId];
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
- (void)failedSendAdRequestFSAdTwinPanelView:(FSAdTwinPanelView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__, error.errorMessage);
    
}

- (void)finishInitAdFSAdTwinPanelView:(FSAdTwinPanelView *)sender {
    NSLog(@"%s", __func__);
    [self.adView loadAd];
}

- (void)failedInitAdFSAdTwinPanelView:(FSAdTwinPanelView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__, error.errorMessage);
}

- (void)failedResponseAdRequestFSAdTwinPanelView:(FSAdTwinPanelView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__, error.errorMessage);
}


@end
