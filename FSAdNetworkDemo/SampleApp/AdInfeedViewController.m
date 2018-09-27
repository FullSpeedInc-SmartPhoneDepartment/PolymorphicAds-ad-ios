//
//  AdInfeedViewController.m
//  SampleApp
//
//  Created by RN-079 on 2015/12/16.
//  Copyright © 2015年 full Speed inc. All rights reserved.
//

#import "AdInfeedViewController.h"
//#import <FSAdNetwork/FSAdInfeedAdLoader.h>
#import <FSAdNetwork/FSAdInfeedView.h>
#import "AdInfeedTableViewCell.h"

#define AD_INFEED_VIEW_HEIGHT 120.0f
//#define INFEED_V100

@interface AdInfeedViewController ()
<UITableViewDataSource, UITableViewDelegate, FSAdInfeedViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSMutableDictionary *adViewList;
@property (nonatomic, assign) BOOL isAdInit;


@end

@implementation AdInfeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.adViewList = [NSMutableDictionary dictionary];
    
    // type(left, right, textonly) imglayout(top, moddle, bottom)
    [self.adViewList setObject:@{@"type":@"left", @"layout":@"top"} forKey:@"4"];
    [self.adViewList setObject:@{@"type":@"right", @"layout":@"top"} forKey:@"6"];
    [self.adViewList setObject:@{@"type":@"textonly", @"layout":@"top"} forKey:@"9"];

    [self.adViewList setObject:@{@"type":@"left", @"layout":@"middle"} forKey:@"14"];
    [self.adViewList setObject:@{@"type":@"right", @"layout":@"middle"} forKey:@"16"];
    [self.adViewList setObject:@{@"type":@"textonly", @"layout":@"middle"} forKey:@"19"];

    [self.adViewList setObject:@{@"type":@"left", @"layout":@"bottom"} forKey:@"24"];
    [self.adViewList setObject:@{@"type":@"right", @"layout":@"bottom"} forKey:@"26"];
    [self.adViewList setObject:@{@"type":@"textonly", @"layout":@"bottom"} forKey:@"29"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.adViewList objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]]) {
        return AD_INFEED_VIEW_HEIGHT;
    }
    return 44;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AdInfeedTableViewCell *cell = (AdInfeedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];

    if (cell.adView) {
        [cell.adView removeFromSuperview];
        cell.adView.delegate = nil;
        cell.adView = nil;
    }
    
    // ad表示
    NSDictionary *dic = [self.adViewList objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]];
    if (dic) {
        cell.textLabel.text = @"";
        
        
        FSAdInfeedView *adView = [[FSAdInfeedView alloc] init];
        cell.adView = adView;
        adView.frame = cell.bounds;
        adView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [cell addSubview:adView];
        adView.delegate = self;

        NSString *strType = [dic objectForKey:@"type"];
        
        if ([strType isEqualToString:@"left"]) {
            adView.infeedType = FSInfeedTypeLeftAd;
        }
        if ([strType isEqualToString:@"right"]) {
            adView.infeedType = FSInfeedTypeRightAd;
        }
        if ([strType isEqualToString:@"textonly"]) {
            adView.infeedType = FSInfeedTypeTextOnly;
        }
        NSString *strLayout = [dic objectForKey:@"layout"];
        if ([strLayout isEqualToString:@"top"]) {
            adView.imagePosision = FSInfeedImagePosTop;
        }
        if ([strLayout isEqualToString:@"middle"]) {
            adView.imagePosision = FSInfeedImagePosMiddle;
        }
        if ([strLayout isEqualToString:@"bottom"]) {
            adView.imagePosision = FSInfeedImagePosBottom;
        }
        
        adView.imageHeight = 90.0;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [adView initAd:AdInfeedAdUnitId];
        });

    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"# %ld", (long)indexPath.row + 1] ;
    }
    return cell;
}

#pragma mark - FSAdInfeedViewDelegate
- (void)finishInitAdFSAdInfeedView:(FSAdInfeedView *)sender {
    NSLog(@"%s", __func__);
#ifdef INFEED_V100
    [sender loadAd];
#else
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect frame = window.bounds;
    [sender loadAdWithSize:CGSizeMake(frame.size.width, AD_INFEED_VIEW_HEIGHT)];
#endif
}

- (void)failedInitAdFSAdInfeedView:(FSAdInfeedView *)sender error:(FSError *)error {
    NSLog(@"%s", __func__);
}


- (void)failedSendAdRequestFSAdInfeedView:(FSAdInfeedView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

- (void)finishedResponseAdRequestFSAdInfeedView:(FSAdInfeedView *)sender {
    NSLog(@"%s", __func__);
}

- (void)failedResponseAdRequestFSAdInfeedView:(FSAdInfeedView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

- (void)emptyAdResponseAdRequestFSAdInfeedView:(FSAdInfeedView *)sender {
    NSLog(@"%s", __func__);
}

- (void)finishedCreateFSAdInfeedView:(FSAdInfeedView *)sender {
    NSLog(@"%s", __func__);
}

- (void)failedCreateFSAdInfeedView:(FSAdInfeedView *)sender error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}

- (void)finishedAdClickFSAdInfeedView:(FSAdInfeedView *)adView {
    NSLog(@"%s", __func__);
}

- (void)failedAdClickFSAdInfeedView:(FSAdInfeedView *)adView error:(FSError *)error {
    NSLog(@"%s %@", __func__ , error.errorMessage);
}
@end
