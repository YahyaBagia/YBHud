//
//  YBHud.m
//  YBHud
//
//  Created by Yahya on 03/02/17.
//  Copyright © 2017 yahya. All rights reserved.
//

#import "YBHud.h"
#import "DGActivityIndicatorView.h"

#define kAnimateDuration    0.25

@implementation YBHud
{
    DGActivityIndicatorView *indicator;
    UIView *blockView;
    
}

-(id)initWithHudType:(DGActivityIndicatorAnimationType)HUDType{
    if (self=[super init]){
        indicator = [[DGActivityIndicatorView alloc]
                     initWithType :  HUDType
                     tintColor    :  [UIColor whiteColor]];
    }
    return self;
}

-(void)showInView:(UIView *)view{
    [self showInView:view animated:NO];
}

-(void)showInView:(UIView *)view animated:(BOOL)shouldAnimate{
    
    blockView = [[UIView alloc] initWithFrame:[view bounds]];
    
    UIColor *hudColor = [UIColor blackColor];
    if(_dimAmount == 0){ _dimAmount = 0.7; }
    
    hudColor = [hudColor colorWithAlphaComponent:_dimAmount];
    
    [blockView setBackgroundColor:hudColor];
    
    if(_tintColor != nil){ indicator.tintColor = _tintColor; }
    
    indicator.frame = CGRectMake(0, 0, 64, 68.5714);
    indicator.center = blockView.center;
    [indicator startAnimating];
    [blockView addSubview:indicator];
    
    if(shouldAnimate){
        indicator.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
        blockView.alpha=0.3;
        [UIView animateWithDuration:kAnimateDuration
                animations:^{
                    indicator.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
                    blockView.alpha = 1.0;
                    [view addSubview:blockView];
                } completion:^(BOOL finished) { }];
    }
    
    
    else{
        [view addSubview:blockView];
    }
}

-(void)dismiss{
    [self dismissAnimated:NO];
}

-(void)dismissAnimated:(BOOL)shouldAnimate{
    if(shouldAnimate){
        [UIView animateWithDuration:kAnimateDuration
                         animations:^{
                             indicator.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
                             blockView.alpha = 0.0;
                         }
                         completion:^(BOOL finished){
                             [blockView removeFromSuperview];
                         }];
    }else{
        [blockView removeFromSuperview];
    }
}

@end
