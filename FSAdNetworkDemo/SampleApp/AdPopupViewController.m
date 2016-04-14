//
//  AdPopupViewController.m
//  SampleApp
//
//  Created by RN-079 on 2015/12/07.
//  Copyright © 2015年 full Speed inc. All rights reserved.
//

#import "AdPopupViewController.h"
#import <FSAdNetwork/FSAdPopupAdLoader.h>

@interface AdPopupViewController ()
<FSAdPopupAdLoaderDelegate>
@end

@implementation AdPopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [FSAdPopupAdLoader sharedInstance].delegate = self;
    [[FSAdPopupAdLoader sharedInstance] initAd:AdPopupAdUnitId intervalTime:0 skipCount:0];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [FSAdPopupAdLoader sharedInstance].delegate = nil;
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
    [[FSAdPopupAdLoader sharedInstance] showAd:AdPopupAdUnitId];
}

#pragma mark -
- (void)finishInitAdFSAdPopup:(FSAdPopupAdLoader *)sender {
    NSLog(@"%s", __func__);
    [[FSAdPopupAdLoader sharedInstance] loadAd:AdPopupAdUnitId];
    
}

- (void)failedInitAdFSAdPopup:(FSAdPopupAdLoader *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

- (void)skipAdCreateFSAdPopup:(FSAdPopupAdLoader *)adLoader {
    NSLog(@"%s", __func__);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"広告表示スキップ" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)failedSendAdRequestFSAdPopup:(FSAdPopupAdLoader *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

- (void)finishedResponseAdRequestFSAdPopup:(FSAdPopupAdLoader *)sender {
    NSLog(@"%s", __func__);    
}

- (void)failedResponseAdRequestFSAdPopup:(FSAdPopupAdLoader *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

- (void)failedAdCreateFSAdPopup:(FSAdPopupAdLoader *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

@end
