//
//  AdCarouselViewController.m
//  SampleApp
//
//  Created by RN-079 on 2015/12/08.
//  Copyright © 2015年 full Speed inc. All rights reserved.
//

#import "AdCarouselViewController.h"
#import <FSAdNetwork/FSAdCarouselView.h>

@interface AdCarouselViewController ()
<FSAdCarouselViewDelegate>
@property (nonatomic, strong) IBOutlet FSAdCarouselView *carouselView;

@end

@implementation AdCarouselViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }

    self.carouselView.delegate = self;
    [self.carouselView initAd:AdCarouselAdUnitId];

}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    self.carouselView.delegate = nil;
    
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

#pragma mark - FSAdCarouselDelegate
- (void)finishInitAdFSAdCarouselView:(FSAdCarouselView *)sender {
    NSLog(@"%s", __func__);
    [self.carouselView loadAd:AdCarouselAdUnitId];
}

- (void)failedInitAdFSAdCarouselView:(FSAdCarouselView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
    
}

- (void)finishedResponseAdRequestFSAdCarouselView:(FSAdCarouselView *)sender {
    NSLog(@"%s", __func__);
//    [self.carouselView showAd:AdCarouselAdUnitId];
}

- (void)failedSendAdRequestFSAdCarouselView:(FSAdCarouselView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

- (void)failedResponseAdRequestFSAdCarouselView:(FSAdCarouselView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

@end
