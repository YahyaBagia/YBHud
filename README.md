# YBHud
A progress hud by using DGActivityIndicatorView

### Installation
Drag and Drop files from YBHud Directory into your XCode Project Directory.

### Usage
```
//Initialize and Display HUD
YBHud *hud = [[YBHud alloc]initWithHudType:indexPath.row];
hud.dimAmount = 0.5;
[hud showInView:self.view animated:YES];

//Dismiss HUD
[hud dismissAnimated:YES];
```
