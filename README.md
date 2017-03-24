# YBHud
A progress hud by using DGActivityIndicatorView

### Installation
Drag and Drop files from YBHud Directory into your XCode Project Directory.

### Usage
```
YBHud *hud = [[YBHud alloc]initWithHudType:indexPath.row]; //Initialization
hud.dimAmount = 0.5; //Customization
[hud showInView:self.view animated:YES]; //Display HUD

[hud dismissAnimated:YES]; //Dismiss HUD
```
