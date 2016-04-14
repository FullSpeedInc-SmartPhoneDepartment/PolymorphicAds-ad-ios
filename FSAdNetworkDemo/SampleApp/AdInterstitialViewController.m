//
//  AdInterstitialViewController.m
//  SampleApp
//
//  Created by RN-079 on 2015/12/07.
//  Copyright © 2015年 full Speed inc. All rights reserved.
//

#import "AdInterstitialViewController.h"
#import <FSAdNetwork/FSAdInterstitialAdLoader.h>
#import <FSAdAnalytics/FSAdAnalytics.h>

@interface AdInterstitialViewController ()
<FSAdInterstitialAdLoaderDelegate>

@end

@implementation AdInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [FSAdInterstitialAdLoader sharedInstance].delegate = self;
    [[FSAdInterstitialAdLoader sharedInstance] initAd:AdInterstitialAdUnitId intervalTime:0 skipCount:0];    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [FSAdInterstitialAdLoader sharedInstance].delegate = nil;
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

- (IBAction)buttonPushed:(id)sender {
    [[FSAdInterstitialAdLoader sharedInstance] showAd:AdInterstitialAdUnitId];
}

#pragma mark -
- (void)finishInitAdFSAdInterstitial:(FSAdInterstitialAdLoader *)sender {
    NSLog(@"%s", __func__);
    [[FSAdInterstitialAdLoader sharedInstance] loadAd:AdInterstitialAdUnitId];
}

- (void)failedInitAdFSAdInterstitial:(FSAdInterstitialAdLoader *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

- (void)skipAdCreateFSAdInterstitial:(FSAdInterstitialAdLoader *)adLoader {
    NSLog(@"%s", __func__);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"広告表示スキップ" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)finishedAdCreateFSAdInterstitial:(FSAdInterstitialAdLoader *)sender {
    NSLog(@"%s", __func__);
}

- (void)failedAdCreateFSAdInterstitial:(FSAdInterstitialAdLoader *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

@end
