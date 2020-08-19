//
//  CGSizeExtensions.swift
//  QYTipCollection
//
//  Created by cyd on 2020/8/18.
//  Copyright © 2020 qianyuIm. All rights reserved.
//

import UIKit

extension CGSize: QYUtilCoreCompatible {}

extension QYUtilCoreWrapper where Base == CGSize {
    /// 将一个CGSize像素对齐
    var flat: CGSize {
        return CGSize(width: base.width.qy.flat, height: base.height.qy.flat)
    }
    var rect: CGRect {
        return CGRect(origin: .zero, size: base)
    }
}
