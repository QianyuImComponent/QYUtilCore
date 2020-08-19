//
//  UIViewExtensions.swift
//  QYTipCollection
//
//  Created by cyd on 2020/8/18.
//  Copyright © 2020 qianyuIm. All rights reserved.
//

import UIKit

extension QYUtilCoreWrapper where Base: UIView {
    var left: CGFloat {
        get {
            return base.frame.origin.x
        }
        nonmutating set {
            var f = base.frame
            f.origin.x = newValue
            base.frame = f
        }
    }
    var top: CGFloat {
        get {
            return base.frame.origin.y
        }
        nonmutating set {
            var f = base.frame
            f.origin.y = newValue
            base.frame = f
        }
    }
    var right: CGFloat {
        get {
            return base.frame.origin.x + base.frame.size.width
        }
        nonmutating set {
            var f = base.frame
            f.origin.x = newValue - f.size.width
            base.frame = f
        }
    }
    var bottom: CGFloat {
        get {
            return base.frame.origin.y + base.frame.size.height
        }
        nonmutating set {
            var f = base.frame
            f.origin.y = newValue - f.size.height
            base.frame = f
        }
    }
    var width: CGFloat {
        get {
            return base.frame.width
        }
        nonmutating set {
            var f = base.frame
            f.size.width = newValue
            base.frame = f
        }
    }
    var height: CGFloat {
        get {
            return base.frame.height
        }
        nonmutating set {
            var f = base.frame
            f.size.height = newValue
            base.frame = f
        }
    }
    var size: CGSize {
        get {
            return base.frame.size
        }
        nonmutating set {
            var f = base.frame
            f.size = newValue
            base.frame = f
        }
    }
    var centerY: CGFloat {
        get {
            return base.center.y
        }
        nonmutating set {
            base.center = CGPoint(x: base.center.x, y: newValue)
        }
    }
    /// 添加子试图
    /// - Parameter views: views
    func addSubviews(_ views: UIView...) {
        views.forEach{ base.addSubview($0) }
    }
    /// 圆角 masksToBounds & cornerRadius
    /// - Parameter cornerRadius: cornerRadius
    func roundCorners(_ cornerRadius: CGFloat) {
        base.layer.masksToBounds = true
        base.layer.cornerRadius = cornerRadius
    }
    /// 添加圆角
    /// - Parameters:
    ///   - corners: eg: [.bottomLeft, .topRight]
    ///   - radius:
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            base.layer.masksToBounds = true
            base.layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
            base.layer.cornerRadius = radius
        } else {
            let maskPath = UIBezierPath(roundedRect: base.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            base.layer.mask = shape
        }
    }
    /// 控制器
    var viewController: UIViewController? {
        var nextResponder: UIResponder? = base
        repeat {
            nextResponder = nextResponder?.next
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
        } while nextResponder != nil
        return nil
    }
    var navigationController: UINavigationController? {
        var nextResponder: UIResponder? = base
        repeat {
            nextResponder = nextResponder?.next
            if let viewController = nextResponder as? UINavigationController {
                return viewController
            }
        } while nextResponder != nil
        return nil
    }
}
