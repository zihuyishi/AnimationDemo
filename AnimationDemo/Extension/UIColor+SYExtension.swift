//
//  UIColor+SYExtension.swift
//  AnimationDemo
//
//  Created by 李冲 on 15/11/11.
//  Copyright © 2015年 Mola. All rights reserved.
//

import UIKit

extension UIColor {
    static func colorFromHex(rgbValue: Int, alpha: Float) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0xFF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0xFF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
