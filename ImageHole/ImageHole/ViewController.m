//
//  ViewController.m
//  ImageHole
//
//  Created by YehHenChia on 2017/5/31.
//  Copyright © 2017年 YehHenChia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *bgView;

@property (nonatomic, weak) IBOutlet UIImageView *imageview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat radius = 20;
    
    CGRect r = self.imageview.bounds;
//    CGRect r2 = CGRectMake(0,0,40,40); // adjust this as desired!
    UIGraphicsBeginImageContextWithOptions(r.size, NO, 0);
    CGContextRef c = UIGraphicsGetCurrentContext();
//    CGContextAddRect(c, r2);
    
    //! 挖掉圓圈內的
    CGContextAddRect(c, r); //! mark:留下圓圈內的圖
    CGContextAddArc(c, self.imageview.bounds.size.width / 2, self.imageview.bounds.size.height /2, radius, 0, M_PI * 2, NO);
    CGContextEOClip(c);
//    CGContextSetFillColorWithColor(c, [UIColor blackColor].CGColor);
    CGContextFillRect(c, r);
     
    UIImage* maskim = UIGraphicsGetImageFromCurrentImageContext();
    
    CALayer* mask = [CALayer layer];
    mask.frame = r;
    mask.contents = (id)maskim.CGImage;
    self.imageview.layer.mask = mask;
    
    UIGraphicsEndImageContext();
    
    /*
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"1" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(self.imageview.frame.origin.x - radius - 2, self.imageview.frame.origin.y - radius - 2, radius * 2, radius * 2)];
    [btn setBackgroundColor:[UIColor blackColor]];
    btn.layer.cornerRadius = btn.frame.size.width / 2;
    [self.bgView addSubview:btn];
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
