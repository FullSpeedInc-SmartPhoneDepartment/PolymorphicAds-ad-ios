//
//  AdInfeedTableViewCell.m
//  SampleApp
//
//  Created by RN-079 on 2016/02/26.
//  Copyright © 2016年 full Speed inc. All rights reserved.
//

#import "AdInfeedTableViewCell.h"

@implementation AdInfeedTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    if (self.adView) {
        self.adView.delegate = nil;
        self.adView = nil;
    }
}
@end
