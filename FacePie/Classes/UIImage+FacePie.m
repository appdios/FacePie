//
//  UIImage+FacePie.m
//  FacePie
//
//  Created by Sumit Kumar on 1/30/14.
//  Copyright (c) 2014 Appdios Inc. All rights reserved.
//

#import "UIImage+FacePie.h"

@implementation UIImage (FacePie)

+ (UIImage*)facePieImages:(NSArray*)images toSize:(CGSize)size
{
    return [UIImage facePieImages:images toSize:size seperatorColor:[UIColor whiteColor]];
}

+ (UIImage*)facePieImages:(NSArray*)images toSize:(CGSize)size seperatorColor:(UIColor*)seperatorColor
{
    if ([images count] == 0) {
        return nil;
    }
    if ([images count] == 1) {
        return images[0];
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    if ([images count] == 2) {
        UIImage *firstImage     =   [UIImage cropImage:images[0] ofSize:size fromAngle:180 toAngle:360];
        UIImage *secondImage    =  [UIImage cropImage:images[1] ofSize:size fromAngle:0 toAngle:180];
        
        [firstImage drawAtPoint:CGPointMake(0.0, 0)];
        [secondImage drawAtPoint:CGPointMake(size.width/2.0, 0)];
    }
    else if ([images count] == 3) {
        UIImage *firstImage     =   [UIImage cropImage:images[0] ofSize:size fromAngle:180 toAngle:360];
        UIImage *secondImage    =  [UIImage cropImage:images[1] ofSize:size fromAngle:0 toAngle:90];
        UIImage *thirdImage     =   [UIImage cropImage:images[2] ofSize:size fromAngle:90 toAngle:180];
        
        [firstImage drawAtPoint:CGPointMake(0.0, 0)];
        [secondImage drawAtPoint:CGPointMake(size.width/2.0, 0)];
        [thirdImage drawAtPoint:CGPointMake(size.width/2.0, size.height/2.0)];
    }
    else if ([images count] > 3) {
        UIImage *firstImage     =   [UIImage cropImage:images[0] ofSize:size fromAngle:270 toAngle:360];
        UIImage *secondImage    =  [UIImage cropImage:images[1] ofSize:size fromAngle:180 toAngle:270];
        UIImage *thirdImage     =   [UIImage cropImage:images[2] ofSize:size fromAngle:0 toAngle:90];
        UIImage *fourthImage    =  [UIImage cropImage:images[3] ofSize:size fromAngle:90 toAngle:180];
        
        [firstImage drawAtPoint:CGPointMake(0.0, 0)];
        [secondImage drawAtPoint:CGPointMake(0.0, size.height/2.0)];
        [thirdImage drawAtPoint:CGPointMake(size.width/2.0, 0)];
        [fourthImage drawAtPoint:CGPointMake(size.width/2.0, size.height/2.0)];
    }
    
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGFloat separatorSize = 0.5;
    if (scale == 1) {
        separatorSize = 1.0;
    }
    
    CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), seperatorColor.CGColor);
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(size.width/2.0-separatorSize, 0, separatorSize, size.height));
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, size.height/2.0-separatorSize, size.width, separatorSize));
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return finalImage;
}


+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        if ([[UIScreen mainScreen] scale] == 2.0) {
            UIGraphicsBeginImageContextWithOptions(newSize, YES, [[UIScreen mainScreen] scale]);
        } else {
            UIGraphicsBeginImageContext(newSize);
        }
    } else {
        UIGraphicsBeginImageContext(newSize);
    }
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage*)cropImage:(UIImage*)image ofSize:(CGSize)size fromAngle:(CGFloat)fromAngle toAngle:(CGFloat)toAngle{
    UIImage *finalImage = nil;
    
    UIImage *pImage = [UIImage imageWithImage:image scaledToSize:size];
    
    if (toAngle - fromAngle == 180) {
        // Draw Half
        if (fromAngle == 180) {
            //Crop Left Part
            UIGraphicsBeginImageContextWithOptions(
                                                   CGSizeMake(size.width/2.0, size.height), NO, [UIScreen mainScreen].scale);
            [pImage drawAtPoint:CGPointMake(-size.width/4.0, 0)];
            finalImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
        else{
            //Crop Right Part
            UIGraphicsBeginImageContextWithOptions(
                                                   CGSizeMake(size.width/2.0, size.height), NO, [UIScreen mainScreen].scale);
            [pImage drawAtPoint:CGPointMake(-size.width/4.0, 0)];
            finalImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
    }
    else if(toAngle - fromAngle == 90){
        //Scale to 1/2
        finalImage = [UIImage imageWithImage:pImage scaledToSize:CGSizeMake(size.width/2.0, size.height/2.0)];
    }
    else{
        //Return original with Size
        finalImage = pImage;
    }
    return finalImage;
}
@end
