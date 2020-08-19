//
//  QYUtilCore.swift
//  QYUtilCore
//
//  Created by cyd on 2020/8/18.
//

import Foundation.NSObject

public struct QYUtilCoreWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol QYUtilCoreCompatible {
    associatedtype CompatibleType
    static var qy: QYUtilCoreWrapper<CompatibleType>.Type { get set }
    var qy: QYUtilCoreWrapper<CompatibleType> { get set }
}

extension QYUtilCoreCompatible {
    public static var qy: QYUtilCoreWrapper<Self>.Type {
        get {
            return QYUtilCoreWrapper<Self>.self
        }
        set {
            // this enables using Reactive to "mutate" base type
        }
    }
    public var qy: QYUtilCoreWrapper<Self> {
        get {
            return QYUtilCoreWrapper(self)
        }
        set {
           
        }
    }
}

extension NSObject: QYUtilCoreCompatible {}

