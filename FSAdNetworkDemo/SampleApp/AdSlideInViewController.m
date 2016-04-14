//
//  AdSlideInViewController.m
//  SampleApp
//
//  Created by RN-079 on 2016/02/18.
//  Copyright © 2016年 full Speed inc. All rights reserved.
//

#import "AdSlideInViewController.h"
#import <FSAdNetwork/FSAdSlideInAdLoader.h>

@interface AdSlideInViewController ()
<FSAdSlideInAdLoaderDelegate>
@end

@implementation AdSlideInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [FSAdSlideInAdLoader sharedInstance].delegate = self;
    [[FSAdSlideInAdLoader sharedInstance] initAd:AdSlideInAdUnitId intervalTime:0 skipCount:0 displayTime:6];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [FSAdSlideInAdLoader sharedInstance].delegate = nil;
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
    [[FSAdSlideInAdLoader sharedInstance] showAd:AdSlideInAdUnitId];
}

#pragma mark -
- (void)finishInitAdFSAdSlideIn:(FSAdSlideInAdLoader *)sender {
    NSLog(@"%s", __func__);
    [[FSAdSlideInAdLoader sharedInstance] loadAd:AdSlideInAdUnitId];
}

- (void)failedInitAdFSAdSlideIn:(FSAdSlideInAdLoader *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
    
}

- (void)finishedResponseAdRequestFSAdSlideIn:(FSAdSlideInAdLoader *)sender {
    NSLog(@"%s", __func__);
}

- (void)skipAdCreateFSAdSlideIn:(FSAdSlideInAdLoader *)adLoader {
    NSLog(@"%s", __func__);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"skipped" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)failedSendAdRequestFSAdSlideIn:(FSAdSlideInAdLoader *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

- (void)failedResponseAdRequestFSAdSlideIn:(FSAdSlideInAdLoader *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

- (void)failedAdCreateFSAdSlideIn:(FSAdSlideInAdLoader *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
    
}

@end
