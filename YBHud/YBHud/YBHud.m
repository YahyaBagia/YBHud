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

#define kIndicatorWidth     64
#define kIndicatorHeight    68.5714

#define kTransformScaleDown     CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001)
#define kTransformScaleOriginal CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)

@implementation YBHud
{
    DGActivityIndicatorView *indicator;
    UILabel *textLabel;
    UIView *blockView;
    
}

-(id)initWithHudType:(DGActivityIndicatorAnimationType)HUDType andText:(NSString *)text{
    if (self=[super init]){
        
        _tintColor = [UIColor whiteColor];
        _textFont = [UIFont boldSystemFontOfSize:18];
        _text = text;
        
        indicator = [[DGActivityIndicatorView alloc]
                     initWithType :  HUDType
                     tintColor    :  _tintColor];
    }
    return self;
}

-(void)showInView:(UIView *)view{
    [self showInView:view animated:NO];
}

-(void)showInView:(UIView *)view animated:(BOOL)shouldAnimate{
    
    blockView = [[UIView alloc] initWithFrame:[view bounds]];
    
    if(_UserInteractionDisabled) blockView.userInteractionEnabled = NO;
    
    UIColor *hudColor = (_hudColor == nil) ? [UIColor blackColor] : _hudColor;
    if(_dimAmount == 0){ _dimAmount = 0.7; }
    
    hudColor = [hudColor colorWithAlphaComponent:_dimAmount];
    
    [blockView setBackgroundColor:hudColor];
    
    if(_tintColor != nil){ indicator.tintColor = _tintColor; }
    
    indicator.frame = CGRectMake(0, 0, kIndicatorWidth, kIndicatorHeight);
    indicator.center = blockView.center;
    [indicator startAnimating];
    [blockView addSubview:indicator];
    
    if(_text.length > 0){
        CGRect labelFrame = CGRectMake(8, kIndicatorHeight + 4, blockView.frame.size.width - 16, 0);
        textLabel = [[UILabel alloc] initWithFrame:labelFrame];
        textLabel.numberOfLines = 0;
        textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = _tintColor;
        textLabel.font = _textFont;
        textLabel.text = _text;
        [blockView addSubview:textLabel];
    }
    
    if(shouldAnimate){

        indicator.transform = kTransformScaleDown;
        if(textLabel){
            textLabel.transform = kTransformScaleDown;
        }
        
        blockView.alpha=0.3;
        [UIView animateWithDuration:kAnimateDuration
                animations:^{

                    indicator.transform = kTransformScaleOriginal;
                    if(textLabel){
                        textLabel.transform = kTransformScaleOriginal;
                    }
                    
                    blockView.alpha = 1.0;
                    [view addSubview:blockView];
                } completion:^(BOOL finished) { }];
    }
    
    
    else{
        [view addSubview:blockView];
    }
    
    /*Add Constraints*/
    blockView.translatesAutoresizingMaskIntoConstraints = false;
    
    NSLayoutConstraint *blockTrailing =[NSLayoutConstraint
                                   constraintWithItem:blockView
                                   attribute:NSLayoutAttributeTrailing
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:view
                                   attribute:NSLayoutAttributeTrailing
                                   multiplier:1.0f
                                   constant:0.f];
    
    NSLayoutConstraint *blockLeading = [NSLayoutConstraint
                                   constraintWithItem:blockView
                                   attribute:NSLayoutAttributeLeading
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:view
                                   attribute:NSLayoutAttributeLeading
                                   multiplier:1.0f
                                   constant:0.f];
    
    NSLayoutConstraint *blockBottom = [NSLayoutConstraint
                                  constraintWithItem:blockView
                                  attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:view
                                  attribute:NSLayoutAttributeBottom
                                  multiplier:1.0f
                                  constant:0.f];
    
    NSLayoutConstraint *blockTop = [NSLayoutConstraint
                               constraintWithItem: blockView
                               attribute: NSLayoutAttributeTop
                               relatedBy: NSLayoutRelationEqual
                               toItem: view
                               attribute: NSLayoutAttributeTop
                               multiplier: 1.0f
                               constant: 0.f];
    
    [view addConstraints:@[blockTrailing, blockLeading, blockBottom, blockTop]];
    
    
    indicator.translatesAutoresizingMaskIntoConstraints = false;
    
    NSLayoutConstraint *indicatorWidth = [NSLayoutConstraint
                                 constraintWithItem:indicator
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                 constant:kIndicatorWidth];
    
    NSLayoutConstraint *indicatorHeight = [NSLayoutConstraint
                                  constraintWithItem:indicator
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                  multiplier:1.0f
                                  constant:kIndicatorHeight];
    
    [[indicator.centerXAnchor constraintEqualToAnchor:blockView.centerXAnchor] setActive:YES];
    
    [[indicator.centerYAnchor constraintEqualToAnchor:blockView.centerYAnchor] setActive:YES];
    
    [indicator addConstraints:@[indicatorWidth, indicatorHeight]];
    
    
    if(textLabel){
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        NSLayoutConstraint *labelTop = [NSLayoutConstraint
                                        constraintWithItem:textLabel
                                        attribute:NSLayoutAttributeTop
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:indicator
                                        attribute:NSLayoutAttributeTop
                                        multiplier:1.0f
                                        constant:kIndicatorHeight + 4];
        
        NSLayoutConstraint *labelTrailing = [NSLayoutConstraint
                                             constraintWithItem:textLabel
                                             attribute:NSLayoutAttributeTrailing
                                             relatedBy:NSLayoutRelationEqual
                                             toItem:blockView
                                             attribute:NSLayoutAttributeTrailing
                                             multiplier:1.0f constant:-8 ];
        
        NSLayoutConstraint *labelLeading = [NSLayoutConstraint
                                            constraintWithItem:textLabel
                                            attribute:NSLayoutAttributeLeading
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:blockView
                                            attribute:NSLayoutAttributeLeading
                                            multiplier:1.0f
                                            constant:8];
    
        
        [[textLabel.centerXAnchor constraintEqualToAnchor:blockView.centerXAnchor] setActive:YES];

        [blockView addConstraints:@[labelTop, labelTrailing, labelLeading ]];
    
    }
    
}

-(void)dismiss{
    [self dismissAnimated:NO];
}

-(void)dismissAnimated:(BOOL)shouldAnimate{
    if(shouldAnimate){
        [UIView animateWithDuration:kAnimateDuration
                         animations:^{
                             
                             indicator.transform = kTransformScaleDown;
                             if(textLabel){
                                 textLabel.transform = kTransformScaleDown;
                             }
                             
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
