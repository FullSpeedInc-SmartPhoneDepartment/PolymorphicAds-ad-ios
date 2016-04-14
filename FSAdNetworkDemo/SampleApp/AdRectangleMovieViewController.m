//
//  AdRectangleMovieViewController.m
//  SampleApp
//
//  Created by RN-079 on 2016/03/23.
//  Copyright © 2016年 full Speed inc. All rights reserved.
//

#import "AdRectangleMovieViewController.h"
#import <FSAdNetwork/FSAdRectangleMovieView.h>

@interface AdRectangleMovieViewController ()
<FSAdRectangleMovieViewDelegate>
@property (nonatomic, weak) IBOutlet UILabel *msgLabel;
@property (nonatomic, assign) BOOL isReady;
@property (nonatomic, strong) FSAdRectangleMovieView *movieView;
@property (weak, nonatomic) IBOutlet UIView *adView;

@end

@implementation AdRectangleMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.msgLabel.text = @"ad init....";
        // 初期化、デリゲート設定
        self.movieView = [[FSAdRectangleMovieView alloc] initWithDelegate:self];
        
        // ビューに配置
        self.movieView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 9.0 / 16.0);
        [self.adView addSubview:self.movieView];
        
        // 広告初期化
        [self.movieView initAd:AdRectangleMovieAdUnitId];
    });
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
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
    if ([self.movieView isDisplayAd:AdRectangleMovieAdUnitId]) {
        return YES;
    }
    BOOL result = [self.movieView showAd:AdRectangleMovieAdUnitId];
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
        [self.movieView createAd:AdRectangleMovieAdUnitId];
    });
}

#pragma mark -
- (void)finishInitAdFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
    self.msgLabel.text = @"ad loading....";
    [self.movieView loadAd:AdRectangleMovieAdUnitId];
}

- (void)failedInitAdFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
    self.msgLabel.text = [NSString stringWithFormat:@"failed(%@)", error.errorMessage];
}

- (void)failedSendAdRequestFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
    self.msgLabel.text = [NSString stringWithFormat:@"failed(%@)", error.errorMessage];
}

- (void)finishedResponseAdRequestFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId{
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
    self.msgLabel.text = @"ad creating....";
    [self.movieView createAd:AdRectangleMovieAdUnitId];
}

- (void)failedResponseAdRequestFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
    self.msgLabel.text = [NSString stringWithFormat:@"failed(%@)", error.errorMessage];
}

- (void)emptyAdResponseAdRequestFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
    self.msgLabel.text = [NSString stringWithFormat:@"no ads"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"ad response was empty" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)finishedCreateFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
}

- (void)failedCreateFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
}

- (void)completedMovieFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
}

- (void)finishedAdClickFSAdRectangleMovie:(FSAdRectangleMovieView *)adView adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
}

- (void)failedAdClickFSAdRectangleMovie:(FSAdRectangleMovieView *)adView adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
    self.msgLabel.text = [NSString stringWithFormat:@"failed(%@)", error.errorMessage];
}

- (void)hideAdViewFSAdRectangleMovie:(FSAdRectangleMovieView *)adView adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
    self.msgLabel.text = @"stop";
}

- (void)finishedReadyMovieFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId{
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

- (void)failedReadyMovieFSAdRectangleMovie:(FSAdRectangleMovieView *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error{
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
    self.msgLabel.text = [NSString stringWithFormat:@"failed(%@)", error.errorMessage];
}

@end
