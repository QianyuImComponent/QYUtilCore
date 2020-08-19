//
//  QYColor.swift
//  QYTipCollection
//
//  Created by cyd on 2020/8/18.
//  Copyright © 2020 qianyuIm. All rights reserved.
//

import UIKit

public struct QYColor {
    public static func color(_ hexString: String, transparency: CGFloat = 1) -> UIColor {
        return UIColor.qy.color(hexString: hexString, transparency: transparency) ?? .clear
    }
    /// 主色
    public static let tintColor = color("#F83245")
    /// tabbar
    public static let tabbarColor = color("#768087")
    /// tabbar
    public static let tabbarHighlightColor = color("#F83245")
    /// 全局默认背景色
    public static let backgroundColor = color("#F7F8FA")
}
