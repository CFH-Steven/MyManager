//
//  MacroDefinitionHeader.h
//  MyManager
//
//  Created by iOS on 2018/12/4.
//

#ifndef MacroDefinitionHeader_h
#define MacroDefinitionHeader_h

//宏定义

/*
 屏幕
 */
//屏幕大小
#define ScreenFrame [UIScreen mainScreen].bounds
//屏幕宽
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕高
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//Tabbar高度
#define TabBarHeight (IS_IPHONE_X ? 65 : 49)
// 屏幕宽度
#define ScaleWidth   (ScreenWidth/750)
// 屏幕高度
#define ScaleHeight  (ScreenHeight/1334.0)
//weakself
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
//导航栏和状态栏的高度
#define NavAndStatusHight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏的高度
#define NavigationHeight self.navigationController.navigationBar.frame.size.height
//状态栏的高度
#define StatusHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//是否是iPhone X机型
#define iphoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size))

/*
 设备型号
 */
#define IS_IOS_11  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.f)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_X (IS_IOS_11 && IS_IPHONE && (MIN(ScreenWidth, ScreenHeight) == 375 && MAX(ScreenWidth, ScreenHeight) == 812))


/*
 布局
 */

//布局左边
#define mLeft(view,distance) make.left.equalTo(view).offset(distance)
//布局右边
#define mRight(view,distance) make.right.equalTo(view).offset(distance)
//布局上边
#define mTop(view,distance) make.top.equalTo(view).offset((distance))
//布局下边
#define mBottom(view,distance) make.bottom.equalTo(view).offset((distance))
//布局中心y
#define mCenterY(view) make.centerY.equalTo(view.mas_centerY)
//布局中心x
#define mCenterX(view) make.centerX.equalTo(view.mas_centerX)
//高度
#define mHeight(distance) make.height.offset(distance)
//宽度
#define mWidth(distance) make.width.offset(distance)
/*
 颜色
 */
//随机色
#define RANDOM_COLOR [UIColor colorWithHue: (arc4random() % 256 / 256.0) saturation:((arc4random()% 128 / 256.0 ) + 0.5) brightness:(( arc4random() % 128 / 256.0 ) + 0.5) alpha:1]
//主题色

#define kFont(a) [UIFont systemFontOfSize:a*ScaleWidth]
#define kBoldFont(a) [UIFont fontWithName:@"Helvetica-Bold" size:a*ScaleWidth]
#define kWidth(a) a*ScaleWidth
#define kHeight(a) a*ScaleHeight
#define rgb(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define rgb1(r,a) [UIColor colorWithRed:r/255.0 green:r/255.0 blue:r/255.0 alpha:a]



#define kblack [UIColor colorWithHexString:@"0x000000"]
#define kwhite [UIColor colorWithHexString:@"0xffffff"]
#define kclear [UIColor clearColor]

#define k212121 [UIColor colorWithHexString:@"0x212121"]
#define kf0f0f0 [UIColor colorWithHexString:@"0xf0f0f0"]
#define kcccccc [UIColor colorWithHexString:@"0xcccccc"]
#define kffa30f [UIColor colorWithHexString:@"0xffa30f"]
#define k2e3133 [UIColor colorWithHexString:@"0x2e3133"]
#define k666666 [UIColor colorWithHexString:@"0x666666"]
#define k333333 [UIColor colorWithHexString:@"0x333333"]
#define ke5e5e5 [UIColor colorWithHexString:@"0xe5e5e5"]
#define kbebebe [UIColor colorWithHexString:@"0xbebebe"]
#define kf5f5f5 [UIColor colorWithHexString:@"0xf5f5f5"]
#define k999999 [UIColor colorWithHexString:@"0x999999"]
#define k4a4a4a [UIColor colorWithHexString:@"0x4a4a4a"]
#define kbebebe [UIColor colorWithHexString:@"0xbebebe"]
#define k868686 [UIColor colorWithHexString:@"0x868686"]
#define kdbdbdb [UIColor colorWithHexString:@"0xdbdbdb"]
#define kfcfcfc [UIColor colorWithHexString:@"0xfcfcfc"]
#define kf2f2f2 [UIColor colorWithHexString:@"0xf2f2f2"]
#define kf78182 [UIColor colorWithHexString:@"0xf78182"]
#define k32bd65 [UIColor colorWithHexString:@"0x32bd65"]
#define k999999 [UIColor colorWithHexString:@"0x999999"]
#define kff0036 [UIColor colorWithHexString:@"0xff0036"]
#define kbcbcbc [UIColor colorWithHexString:@"0xbcbcbc"]
#define k7d7d7d [UIColor colorWithHexString:@"0x7d7d7d"]
#define ka9a9a9 [UIColor colorWithHexString:@"0xa9a9a9"]
#define k3296fa [UIColor colorWithHexString:@"0x3296fa"]
#define kffe0ad [UIColor colorWithHexString:@"0xffe0ad"]
#define kababab [UIColor colorWithHexString:@"0xababab"]
#define kffe2b2 [UIColor colorWithHexString:@"0xffe2b2"]
#define kf7f7f7 [UIColor colorWithHexString:@"0xf7f7f7"]
#define ke5e5e5 [UIColor colorWithHexString:@"0xe5e5e5"]
#define ke6e6e6 [UIColor colorWithHexString:@"0xe6e6e6"]
#define kababab [UIColor colorWithHexString:@"0xababab"]
#define kf54c4c [UIColor colorWithHexString:@"0xf54c4c"]
#define kf56c6c [UIColor colorWithHexString:@"0xf56c6c"]
#define ke9e9e9 [UIColor colorWithHexString:@"0xe9e9e9"]
#define k15bc83 [UIColor colorWithHexString:@"0x15bc83"]

#endif /* MacroDefinitionHeader_h */
