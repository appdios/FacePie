//
//  UIImage+FacePie.h
//  FacePie
//
//  Created by Sumit Kumar on 1/30/14.
//  Copyright (c) 2014 Appdios Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FacePie)

+ (UIImage*)facePieImages:(NSArray*)images toSize:(CGSize)size;
+ (UIImage*)facePieImages:(NSArray*)images toSize:(CGSize)size seperatorColor:(UIColor*)seperatorColor;

@end
