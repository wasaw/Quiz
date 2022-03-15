//
//  Extensions.swift
//  Quiz
//
//  Created by Александр Меренков on 3/15/22.
//

import UIKit

// MARK: -UIColor

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let backgroundColor = UIColor.rgb(red: 38, green: 38, blue: 98)
    static let questionFormBackground = UIColor.rgb(red: 255, green: 128, blue: 0)
    static let answerCellBackground = UIColor.rgb(red: 112, green: 39, blue: 55)
    static let fontColor = UIColor.rgb(red: 236, green: 213, blue: 187)
    static let addedColor = UIColor.rgb(red: 169, green: 192, blue: 226)
}
