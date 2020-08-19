//
//  FloatingPointExtensions.swift
//  QYTipCollection
//
//  Created by cyd on 2020/8/18.
//  Copyright © 2020 qianyuIm. All rights reserved.
//

import UIKit

extension CGFloat: QYUtilCoreCompatible {}

extension QYUtilCoreWrapper where Base == CGFloat {
    
    /// 基于当前设备的屏幕倍数， 进行像素向上取整。
    /// 2x 下 2.1 ---> 2.5  3x 下 2.1 ---> 2.333
    var flat: CGFloat {
        let s = UIScreen.main.scale
        return ceil(self.base * s) / s
    }
    /// 类似flat()，只不过 flat 是像素向上取整，而 floorInPixel 是像素向下取整
    var floorInPixel: CGFloat {
        let s = UIScreen.main.scale
        return floor(self.base * s) / s
    }
    /// 用于居中运算
    func center(_ child: CGFloat) -> CGFloat {
        return ((base - child) / 2.0).qy.flat
    }
}
