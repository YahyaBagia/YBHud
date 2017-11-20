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
-(id)initWithHudType:(DGActivityIndicatorAnimationType)HUDType andText:(NSString *)text;

-(void)showInView:(UIView *)view;
-(void)showInView:(UIView *)view animated:(BOOL)shouldAnimate;
-(void)dismiss;
-(void)dismissAnimated:(BOOL)shouldAnimate;

//Public Properties
@property (nonatomic, retain) UIColor *tintColor; // Tint Color of the Loader and Text (Optional) (Default : White)
@property (nonatomic, retain) UIColor *hudColor;  // Background color of HUD (Optional) (Default : Black)
@property (nonatomic) CGFloat dimAmount;          // Dim Amount of HUD (Optional) (Default : 0.7)
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) UIFont *textFont;

//USER INTERACTION
@property (nonatomic) BOOL UserInteractionDisabled;

@end
