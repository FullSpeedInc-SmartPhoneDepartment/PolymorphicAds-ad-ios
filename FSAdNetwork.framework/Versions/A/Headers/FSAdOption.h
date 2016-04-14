//
//  FSAdOption.h
//  Polymorphic
//
//  Created by RN-079 on 2016/03/01.
//  Copyright © 2016年 fullSpeed inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSAdOption : NSObject

/**
 if set YES, output log to console
 */
+ (void)debugLogEnable:(BOOL)enable;

/**
 if set YES, test ad will be displayed
 
 You NEED to set Yes in development phase
 and do NOT forget to set NO before release app!
 */
+ (void)testModeEnable:(BOOL)enable;

@end
