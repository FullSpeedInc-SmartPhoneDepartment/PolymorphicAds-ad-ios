//
//  AdPictureInPictureViewController.m
//  SampleApp
//
//  Created by RN-079 on 2015/12/22.
//  Copyright © 2015年 full Speed inc. All rights reserved.
//

#import "AdPictureInPictureViewController.h"
#import <FSAdNetwork/FSAdPiPAdLoader.h>

@interface AdPictureInPictureViewController ()
<UITableViewDataSource, UITableViewDelegate, FSAdPiPAdLoaderDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
//@property (nonatomic, assign) BOOL isReady;
@property (nonatomic, assign) BOOL isMovieStart;
@property (nonatomic, assign) BOOL alertFlag;
@end

@implementation AdPictureInPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"########## PiP表示！！！！ ##############");
        [FSAdPiPAdLoader sharedInstance].delegate = self;
        [[FSAdPiPAdLoader sharedInstance] initAd:AdPiPAdUnitId];
    });
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [FSAdPiPAdLoader sharedInstance].delegate = nil;
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
    if ([[FSAdPiPAdLoader sharedInstance] isDisplayAd:AdPiPAdUnitId]) {
        return YES;
    }
    BOOL result = [[FSAdPiPAdLoader sharedInstance] showAd:AdPiPAdUnitId position:FSAdPiPPositionTypeRightBottom];
    return result;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"#1";
    }
    return @"#2";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"(1) ad load";
        }
        if (indexPath.row == 1) {
            cell.textLabel.text = @"(2) ad create";
        }
        if (indexPath.row == 2) {
            cell.textLabel.text = @"(3) ad show";
        }
    } else {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"(1) ad load & ad create";
        }
        if (indexPath.row == 1) {
            cell.textLabel.text = @"(2) ad show";
        }
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s row:%ld", __func__, (long)indexPath.row);
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [[FSAdPiPAdLoader sharedInstance] loadAd:AdPiPAdUnitId];
            self.alertFlag = YES;
        }
        if (indexPath.row == 1) {
            [[FSAdPiPAdLoader sharedInstance] createAd:AdPiPAdUnitId];
        }
        if (indexPath.row == 2) {
            if (![[FSAdPiPAdLoader sharedInstance] isReadyAd:AdPiPAdUnitId]) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"now preparing" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
                return;
            }
            BOOL result = [self movieStart];
            if (!result) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"failed to play movie" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
            }
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [[FSAdPiPAdLoader sharedInstance] loadAndCreateAd:AdPiPAdUnitId];
            self.alertFlag = NO;
        }
        if (indexPath.row == 1) {
            if (![[FSAdPiPAdLoader sharedInstance] isReadyAd:AdPiPAdUnitId]) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"now preparing" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
                return;
            }
            BOOL result = [self movieStart];
            if (!result) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"failed to play movie" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
            }
        }
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
}

#pragma mark - FSAdPiPAdLoaderDelegate
- (void)finishInitAdFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);    
}

- (void)failedInitAdFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
    
}

- (void)failedSendAdRequestFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
}

- (void)finishedResponseAdRequestFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
    if (self.alertFlag) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"ad response received" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

- (void)failedResponseAdRequestFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"failed to receive ad response" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)emptyAdResponseAdRequestFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"ad response was empty" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)finishedReadyMovieFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"ready!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)failedReadyMovieFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"failed to load movie" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)finishedCreateFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId{
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
}

- (void)failedCreateFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId error:(FSError *)error{
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
}

- (void)finishedAdClickFSAdPiP:(FSAdPiPAdLoader *)adView adUnitId:(NSString *)adUnitId{
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
}

- (void)failedAdClickFSAdPiP:(FSAdPiPAdLoader *)adView adUnitId:(NSString *)adUnitId error:(FSError *)error {
    NSLog(@"%s adUnitId:%@ error:%@", __func__, adUnitId, error.errorMessage);
}

- (void)completedMovieFSAdPiP:(FSAdPiPAdLoader *)sender adUnitId:(NSString *)adUnitId{
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"finished playing" message:@"playing movie finished" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [av show];
    });
}

- (void)hideAdViewFSAdPiP:(FSAdPiPAdLoader *)adView adUnitId:(NSString *)adUnitId {
    NSLog(@"%s adUnitId:%@", __func__, adUnitId);    
}
@end
