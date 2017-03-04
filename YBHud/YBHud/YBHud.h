//
//  YBHud.h
//  YBHud
//
//  Created by Yahya on 03/02/17.
//  Copyright © 2017 yahya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGActivityIndicatorView.h"

@interface YBHud : NSObject

//Public Methods
-(id)initWithHudType:(DGActivityIndicatorAnimationType)HUDType;

-(void)showInView:(UIView *)view;
-(void)showInView:(UIView *)view animated:(BOOL)shouldAnimate;
-(void)dismiss;
-(void)dismissAnimated:(BOOL)shouldAnimate;

//Public Properties
@property (nonatomic, retain) UIColor *tintColor; // Assign Tint Color of the Loader (Optional) (Default : White)
@property (nonatomic) CGFloat dimAmount; // Assign Dim Amount of HUD (Optional) (Default : 0.7)

@end
