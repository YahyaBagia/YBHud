//
//  ViewController.m
//  YBHud
//
//  Created by Yahya on 03/02/17.
//  Copyright © 2017 yahya. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "YBHud.h"

#define kIdentifier     @"Identifier"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    YBHud *hud;
    NSArray *types;
    NSArray *typeNames;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:237/255.0f green:85/255.0f blue:101/255.0f alpha:1.0f];
    
    types = @[@(DGActivityIndicatorAnimationTypeNineDots),
              @(DGActivityIndicatorAnimationTypeTriplePulse),
              @(DGActivityIndicatorAnimationTypeFiveDots),
              @(DGActivityIndicatorAnimationTypeRotatingSquares),
              @(DGActivityIndicatorAnimationTypeDoubleBounce),
              @(DGActivityIndicatorAnimationTypeTwoDots),
              @(DGActivityIndicatorAnimationTypeThreeDots),
              @(DGActivityIndicatorAnimationTypeBallPulse),
              @(DGActivityIndicatorAnimationTypeBallClipRotate),
              @(DGActivityIndicatorAnimationTypeBallClipRotatePulse),
              @(DGActivityIndicatorAnimationTypeBallClipRotateMultiple),
              @(DGActivityIndicatorAnimationTypeBallRotate),
              @(DGActivityIndicatorAnimationTypeBallZigZag),
              @(DGActivityIndicatorAnimationTypeBallZigZagDeflect),
              @(DGActivityIndicatorAnimationTypeBallTrianglePath),
              @(DGActivityIndicatorAnimationTypeBallScale),
              @(DGActivityIndicatorAnimationTypeLineScale),
              @(DGActivityIndicatorAnimationTypeLineScaleParty),
              @(DGActivityIndicatorAnimationTypeBallScaleMultiple),
              @(DGActivityIndicatorAnimationTypeBallPulseSync),
              @(DGActivityIndicatorAnimationTypeBallBeat),
              @(DGActivityIndicatorAnimationTypeLineScalePulseOut),
              @(DGActivityIndicatorAnimationTypeLineScalePulseOutRapid),
              @(DGActivityIndicatorAnimationTypeBallScaleRipple),
              @(DGActivityIndicatorAnimationTypeBallScaleRippleMultiple),
              @(DGActivityIndicatorAnimationTypeTriangleSkewSpin),
              @(DGActivityIndicatorAnimationTypeBallGridBeat),
              @(DGActivityIndicatorAnimationTypeBallGridPulse),
              @(DGActivityIndicatorAnimationTypeRotatingSandglass),
              @(DGActivityIndicatorAnimationTypeRotatingTrigons),
              @(DGActivityIndicatorAnimationTypeTripleRings),
              @(DGActivityIndicatorAnimationTypeCookieTerminator),
              @(DGActivityIndicatorAnimationTypeBallSpinFadeLoader)];
    
    typeNames = @[@"NineDots",
                  @"TriplePulse",
                  @"FiveDots",
                  @"RotatingSquares",
                  @"DoubleBounce",
                  @"TwoDots",
                  @"ThreeDots",
                  @"BallPulse",
                  @"BallClipRotate",
                  @"BallClipRotatePulse",
                  @"BallClipRotateMultiple",
                  @"BallRotate",
                  @"BallZigZag",
                  @"BallZigZagDeflect",
                  @"BallTrianglePath",
                  @"BallScale",
                  @"LineScale",
                  @"LineScaleParty",
                  @"BallScaleMultiple",
                  @"BallPulseSync",
                  @"BallBeat",
                  @"LineScalePulseOut",
                  @"LineScalePulseOutRapid",
                  @"BallScaleRipple",
                  @"BallScaleRippleMultiple",
                  @"TriangleSkewSpin",
                  @"BallGridBeat",
                  @"BallGridPulse",
                  @"RotatingSandglass",
                  @"RotatingTrigons",
                  @"TripleRings",
                  @"CookieTerminator",
                  @"BallSpinFadeLoader"];

    [_tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:kIdentifier];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissHud{
    [hud dismissAnimated:YES];
}

#pragma mark - TableView Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell *cell;
    
    if (cell == nil) {
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        for (id currentObject in nib) {
            if ([currentObject isKindOfClass:[UITableViewCell class]]) {
                cell = (CustomCell *)currentObject;
                break;
            }
        }
    }
    
    cell.lblTitle.text = typeNames[indexPath.row];
    
    DGActivityIndicatorView *activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:(DGActivityIndicatorAnimationType)[types[indexPath.row] integerValue] tintColor:[UIColor whiteColor]];
    
    activityIndicatorView.frame = CGRectMake(0, 0, 64, 68.5714);
    [cell.subView addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    hud = [[YBHud alloc]initWithHudType:indexPath.row];
    hud.dimAmount = 0.5;
    [hud showInView:self.view animated:YES];
    [self performSelector:@selector(dismissHud) withObject:nil afterDelay:3.0];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [types count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark -

@end
