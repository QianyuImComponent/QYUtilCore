//
//  StringExtensions.swift
//  QYTipExtensions
//
//  Created by cyd on 2020/8/18.
//

import UIKit

extension String: QYUtilCoreCompatible {}

extension QYUtilCoreWrapper where Base == String {
    /// Assets 返回图片
    var localImage: UIImage? {
        return UIImage(named: self.base)
    }
    /// 返回 url
    var url: URL? {
        return URL(string: self.base)
    }
    /// 复制到剪贴板
    func copyToPasteboard() {
        UIPasteboard.general.string = base
    }
    /// 删除两端 空格和换行
    var trim: String {
        return self.base.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
}


