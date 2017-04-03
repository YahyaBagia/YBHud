# YBHud
A progress hud by using [DGActivityIndicatorView](https://github.com/gontovnik/DGActivityIndicatorView)

### Screenshot
![](https://github.com/YahyaBagia/YBHud/blob/master/YBHud/Images/YBHud.gif)

### Installation
Drag and Drop files from YBHud Directory into your XCode Project Directory.

### Usage
```sh
YBHud *hud = [[YBHud alloc]initWithHudType:indexPath.row]; //Initialization
hud.dimAmount = 0.5; //Customization
[hud showInView:self.view animated:YES]; //Display HUD

[hud dismissAnimated:YES]; //Dismiss HUD
```
### Requirements
iOS 7.0+

### License
MIT License
