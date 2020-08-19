//
//  UIEdgeInsetsExtensions.swift
//  QYTipCollection
//
//  Created by cyd on 2020/8/18.
//  Copyright © 2020 qianyuIm. All rights reserved.
//

import UIKit

extension UIEdgeInsets: QYUtilCoreCompatible {}

extension QYUtilCoreWrapper where Base == UIEdgeInsets {
    /// 获取UIEdgeInsets在水平方向上的值
    var horizontal: CGFloat {
        return base.left + base.right
    }
    /// 获取UIEdgeInsets在垂直方向上的值
    var vertical: CGFloat {
        return base.top + base.bottom
    }
    
}
