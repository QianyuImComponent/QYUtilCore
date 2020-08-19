//
//  UIColorExtensions.swift
//  QYTipCollection
//
//  Created by cyd on 2020/8/18.
//  Copyright © 2020 qianyuIm. All rights reserved.
//

import UIKit

extension QYUtilCoreWrapper where Base: UIColor {
    /// 是否为黑色 or  白色
    public var isBlackOrWhite: Bool {
        let RGB = base.cgColor.components
        return (RGB![0] > 0.91 && RGB![1] > 0.91 && RGB![2] > 0.91) || (RGB![0] < 0.09 && RGB![1] < 0.09 && RGB![2] < 0.09)
    }
    /// 是否为暗色
    public var isDark: Bool {
        let RGB = base.cgColor.components
        // this algorithm uses the the constants (0.299,0.587,0.114) to determine the brightness of the color and if it is less than half (0.5) than it is considered dark
        let b1 = 0.299 * RGB![0]
        let b2 = 0.587 * RGB![1]
        let b3 = 0.114 * RGB![2]
        let brightness = b1 + b2 + b3
        return brightness < 0.5
    }
    public func isContrasting(_ compareColor: UIColor) -> Bool {
        // get the rgba values for self
        let bg = base.cgColor.components
        // get the rgba values for the color we are comparing with
        let fg = compareColor.cgColor.components
        // compute the brightness of both colors
        let bgLum1 = 0.299 * bg![0]
        let bgLum2 = 0.587 * bg![1]
        let bgLum3 = 0.114 * bg![2]
        let bgLum = bgLum1 + bgLum2 + bgLum3
        
        let fgLum1 = 0.299 * fg![0]
        let fgLum2 = 0.587 * fg![1]
        let fgLum3 = 0.114 * fg![2]
        let fgLum = fgLum1 + fgLum2 + fgLum3
        
        // calculate the contrast using the values we just computed
        let contrast = (bgLum > fgLum) ? (bgLum+0.05)/(fgLum+0.05) : (fgLum+0.05)/(bgLum+0.05)
        
        // check if they contrast
        return 1.4 < contrast
    }
    public func isDistinct(_ compareColor: UIColor) -> Bool {
        // get the rgba values for our self
        let bg = base.cgColor.components
        
        // get the rgba values for the color we are comparing to
        let fg = compareColor.cgColor.components
        
        // set a constant threshold
        let threshold: CGFloat = 0.25
        
        // check if they are distinct
        if (abs((bg?[0])!-(fg?[0])!) > threshold) || (abs((bg?[1])!-(fg?[1])!) > threshold) || (abs((bg?[2])!-(fg?[2])!) > threshold) {
            return !(isGray && compareColor.qy.isGray)
        }
        
        // return that they are not distinct
        return false
    }
    /// Boolean value indicating if the color `isGray`.
    public var isGray: Bool {
        // get the rgba values of the color
        let RGB = base.cgColor.components
        
        // compute color values that help us determine if the color is gray
        let U1 = -0.147 * RGB![0]
        let U2 = 0.289 * RGB![1]
        let U3 = 0.436 * RGB![2]
        let U = U1 - U2 + U3
           
        let V1 = 0.615 * RGB![0]
        let V2 = 0.515 * RGB![1]
        let V3 = 0.100 * RGB![2]
        let V = V1 - V2 - V3
        // check if the U and V values we computed are equivalent to that of gray
        return (abs(U) <= 0.002 && abs(V) <= 0.002)
    }
    /// 随机色
    public static var random: UIColor {
        let red = Int.random(in: 0...255)
        let green = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)
        return self.color(red: red, green: green, blue: blue, transparency: 0.6)!
    }
    public static func color(red: Int,
                      green: Int,
                      blue: Int,
                      transparency: CGFloat = 1) -> UIColor? {
        guard red >= 0 && red <= 255 else { return nil }
        guard green >= 0 && green <= 255 else { return nil }
        guard blue >= 0 && blue <= 255 else { return nil }

        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }

        return UIColor.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
    }
    
    /// hexString ->  #ff5ad2db ,EDE7F6,
    /// 0xEDE7F6, #EDE7F6, #0ff, 0xF0F, ..)
    /// - Parameters:
    ///   - hexString: hexadecimal string (examples: #ff5ad2db
    ///   ,EDE7F6, 0xEDE7F6, #EDE7F6, #0ff, 0xF0F, ..).
    ///   - transparency: optional transparency value (default is 1).
    public static func color(hexString: String,
                       transparency: CGFloat = 1) -> UIColor? {
        var string = ""
        if hexString.count == 8 && hexString.lowercased().hasPrefix("#ff") {
            string = String(hexString[hexString.index(hexString.startIndex, offsetBy: 3)...])
        }else if hexString.lowercased().hasPrefix("0x") {
            string =  hexString.replacingOccurrences(of: "0x", with: "")
        } else if hexString.hasPrefix("#") {
            string = hexString.replacingOccurrences(of: "#", with: "")
        } else {
            string = hexString
        }
        if string.count == 3 { // convert hex to 6 digit format if in short format
            var str = ""
            string.forEach { str.append(String(repeating: String($0), count: 2)) }
            string = str
        }

        guard let hexValue = Int(string, radix: 16) else { return nil }

        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }

        let red = (hexValue >> 16) & 0xff
        let green = (hexValue >> 8) & 0xff
        let blue = hexValue & 0xff
        return self.color(red: red, green: green, blue: blue, transparency: trans)
    }
}

