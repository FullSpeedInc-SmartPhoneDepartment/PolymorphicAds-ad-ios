//
//  ViewController.m
//  SampleApp
//
//  Created by RN-079 on 2015/12/03.
//  Copyright © 2015年 full Speed inc. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger, TABLE_TYPE) {
    TABLE_TYPE_AD_BANNDER,
    TABLE_TYPE_AD_INTERSTITIAL,
    TABLE_TYPE_AD_INFEED,
    TABLE_TYPE_AD_POPUP,
    TABLE_TYPE_AD_SLIDEIN,
    TABLE_TYPE_AD_CAROUSEL,
    TABLE_TYPE_AD_PICTUREINPICTURE,
    TABLE_TYPE_AD_FORCEDMOVIE,
    TABLE_TYPE_AD_RECTANGLEMOVIE,
    TABLE_TYPE_MAX,
};

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return TABLE_TYPE_MAX;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    switch (indexPath.row) {
        case TABLE_TYPE_AD_BANNDER:
            cell.textLabel.text = @"AD Banner sample";
            break;
        case TABLE_TYPE_AD_INTERSTITIAL:
            cell.textLabel.text = @"AD Interstitial sample";
            break;
        case TABLE_TYPE_AD_INFEED:
            cell.textLabel.text = @"AD Infeed sample";
            break;
        case TABLE_TYPE_AD_POPUP:
            cell.textLabel.text = @"AD Popup sample";
            break;
        case TABLE_TYPE_AD_SLIDEIN:
            cell.textLabel.text = @"AD Slide in sample";
            break;
        case TABLE_TYPE_AD_CAROUSEL:
            cell.textLabel.text = @"AD Carousel sample";
            break;
        case TABLE_TYPE_AD_PICTUREINPICTURE:
            cell.textLabel.text = @"AD Picture in Picture sample";
            break;
        case TABLE_TYPE_AD_FORCEDMOVIE:
            cell.textLabel.text = @"AD Forced Movie sample";
            break;
        case TABLE_TYPE_AD_RECTANGLEMOVIE:
            cell.textLabel.text = @"AD Rectanble Movie sample";
            break;
        default:
            break;
    }
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case TABLE_TYPE_AD_BANNDER:
            [self performSegueWithIdentifier:@"toAdBannerView" sender:self];
            break;
        case TABLE_TYPE_AD_INTERSTITIAL:
            [self performSegueWithIdentifier:@"toAdInterstitialView" sender:self];
            break;
        case TABLE_TYPE_AD_INFEED:
            [self performSegueWithIdentifier:@"toAdInfeedView" sender:self];
            break;
        case TABLE_TYPE_AD_POPUP:
            [self performSegueWithIdentifier:@"toAdPopupView" sender:self];
            break;
        case TABLE_TYPE_AD_SLIDEIN:
            [self performSegueWithIdentifier:@"toAdSlideinView" sender:self];
            break;
        case TABLE_TYPE_AD_CAROUSEL:
            [self performSegueWithIdentifier:@"toAdCarouselView" sender:self];
            break;
        case TABLE_TYPE_AD_PICTUREINPICTURE:
            [self performSegueWithIdentifier:@"toAdPictureInPictureView" sender:self];
            break;
        case TABLE_TYPE_AD_FORCEDMOVIE:
            [self performSegueWithIdentifier:@"toAdForcedMovieView" sender:self];
            break;
        case TABLE_TYPE_AD_RECTANGLEMOVIE:
            [self performSegueWithIdentifier:@"toAdRectanbleMovieView" sender:self];
        default:
            break;
    }
    
}
@end
