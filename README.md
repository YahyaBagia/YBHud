# YBHud
A progress hud by using DGActivityIndicatorView

### Installation
Drag and Drop files from YBHud Directory into your XCode Project Directory.

### Usage
```
YBHud *hud = [[YBHud alloc]initWithHudType:indexPath.row];
hud.dimAmount = 0.5;
[hud showInView:self.view animated:YES];
```
