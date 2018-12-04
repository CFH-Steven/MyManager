//
//  UITableViewCell+FHNib.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UITableViewCell+FHNib.h"

@implementation UITableViewCell (FHNib)

/** 加载同类名的 nib */
+ (UINib *)nib{
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}


@end
