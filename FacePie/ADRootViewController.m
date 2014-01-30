//
//  ADRootViewController.m
//  FacePie
//
//  Created by Sumit Kumar on 1/30/14.
//  Copyright (c) 2014 Appdios Inc. All rights reserved.
//

#import "ADRootViewController.h"
#import "UIImage+FacePie.h"

@interface ADRootViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ADRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] init];
    [self.view addSubview:self.imageView];
    
    UIImage *facePieImage = [UIImage facePieImages:@[[UIImage imageNamed:@"img1"],
                             [UIImage imageNamed:@"img2"],
                             [UIImage imageNamed:@"img3"],
                             [UIImage imageNamed:@"img4"]] toSize:CGSizeMake(100, 100)];
    [self.imageView setImage:facePieImage];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.imageView.frame = CGRectMake(0, 0, 100, 100);
    self.imageView.center = self.view.center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
