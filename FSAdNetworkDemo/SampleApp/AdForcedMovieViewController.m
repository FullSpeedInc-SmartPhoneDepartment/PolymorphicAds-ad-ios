//
//  AdForcedMovieViewController.m
//  SampleApp
//
//  Created by RN-079 on 2015/12/24.
//  Copyright © 2015年 full Speed inc. All rights reserved.
//

#import "AdForcedMovieViewController.h"
#import <FSAdNetwork/FSAdForcedMovieAdLoader.h>

@interface AdForcedMovieViewController ()
<FSAdForcedMovieAdLoaderDelegate>
@property (nonatomic, weak) IBOutlet UILabel *msgLabel;
@property (nonatomic, assign) BOOL isReady;


@end

@implementation AdForcedMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.msgLabel.text = @"ad init....";
        [FSAdForcedMovieAdLoader sharedInstance].delegate = self;
        [[FSAdForcedMovieAdLoader sharedInstance] initAd:AdForcedMovieAdUnitId];
    });
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [FSAdForcedMovieAdLoader sharedInstance].delegate = nil;
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

#pragma mark - private methods
- (BOOL)movieStart {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    if ([[FSAdForcedMovieAdLoader sharedInstance] isDisplayAd:AdForcedMovieAdUnitId]) {
        return YES;
    }
    BOOL result = [[FSAdForcedMovieAdLoader sharedInstance] showAd:AdForcedMovieAdUnitId];
    return result;
}

#pragma mark - IBAction
- (IBAction)buttonPushed:(id)sender {
    if (!self.isReady) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"now preparing" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        return;
    }
    self.msgLabel.text = @"ad creating....";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[FSAdForcedMovieAdLoader sharedInstance] createAd:AdForcedMovieAdUnitId];
    });
}

#pragma mark - 
- (void)finishInitAdFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
    self.msgLabel.text = @"ad loading....";
    [[FSAdForcedMovieAdLoader sharedInstance] loadAd:AdForcedMovieAdUnitId];
}

- (void)failedInitAdFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);    
    self.msgLabel.text = [NSString stringWithFormat:@"failed(%@)", error.errorMessage];
}

- (void)failedSendAdRequestFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
    self.msgLabel.text = [NSString stringWithFormat:@"failed(%@)", error.errorMessage];
}

- (void)finishedResponseAdRequestFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId{
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
    self.msgLabel.text = @"ad creating....";
    [[FSAdForcedMovieAdLoader sharedInstance] createAd:AdForcedMovieAdUnitId];
}

- (void)failedResponseAdRequestFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
    self.msgLabel.text = [NSString stringWithFormat:@"failed(%@)", error.errorMessage];
}

- (void)emptyAdResponseAdRequestFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
    self.msgLabel.text = [NSString stringWithFormat:@"no ads"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"ad response was empty" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)finishedCreateFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
}

- (void)failedCreateFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
}

- (void)completedMovieFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
}

- (void)finishedAdClickFSAdForcedMovie:(FSAdForcedMovieAdLoader *)adView adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
}

- (void)failedAdClickFSAdForcedMovie:(FSAdForcedMovieAdLoader *)adView adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
    self.msgLabel.text = [NSString stringWithFormat:@"failed(%@)", error.errorMessage];
}

- (void)hideAdViewFSAdForcedMovie:(FSAdForcedMovieAdLoader *)adView adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
    self.msgLabel.text = @"stop";
}

- (void)finishedReadyMovieFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId{
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
    self.isReady = YES;
    self.msgLabel.text = @"ready";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BOOL result = [self movieStart];
        if (!result) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"failed to play movie" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    });
}

- (void)failedReadyMovieFSAdForcedMovie:(FSAdForcedMovieAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error{
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
    self.msgLabel.text = [NSString stringWithFormat:@"failed(%@)", error.errorMessage];
}
@end
