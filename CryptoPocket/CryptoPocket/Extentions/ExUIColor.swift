//
//  ExUIColor.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 11.03.25.
//

import UIKit

extension UIColor {
    convenience init? (hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        let length = hexSanitized.count
        var rgbValue: UInt64 = 0
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1.0
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgbValue) else {return nil }
        
        if length == 6 {
            red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        } else if length == 8 {
            red = CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
            green = CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0
            blue = CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0
            alpha = CGFloat(rgbValue & 0x000000FF) / 255.0
        } else {
            return nil
        }
       
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
