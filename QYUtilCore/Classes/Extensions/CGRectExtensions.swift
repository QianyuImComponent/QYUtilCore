//
//  CGRectExtensions.swift
//  QYTipCollection
//
//  Created by cyd on 2020/8/18.
//  Copyright © 2020 qianyuIm. All rights reserved.
//

import UIKit
extension CGRect: QYUtilCoreCompatible {}

extension QYUtilCoreWrapper where Base == CGRect {
    /// 将一个CGSize像素对齐
    var flat: CGRect {
        return CGRect(x: base.minX.qy.flat, y: base.minY.qy.flat, width: base.width.qy.flat, height: base.height.qy.flat)
    }
    func setX(_ x: CGFloat) -> CGRect {
        var result = base
        result.origin.x = x.qy.flat
        return result
    }
    func setY(_ y: CGFloat) -> CGRect {
        var result = base
        result.origin.y = y.qy.flat
        return result
    }
    func setXY(_ x: CGFloat, _ y: CGFloat) -> CGRect {
        var result = base
        result.origin.x = x.qy.flat
        result.origin.y = y.qy.flat
        return result
    }
    func setWidth(_ width: CGFloat) -> CGRect {
        var result = base
        result.size.width = width.qy.flat
        return result
    }
    func setHeight(_ height: CGFloat) -> CGRect {
        var result = base
        result.size.height = height.qy.flat
        return result
    }
    func setSize(size: CGSize) -> CGRect {
        var result = base
        result.size = size.qy.flat
        return result
    }
}
