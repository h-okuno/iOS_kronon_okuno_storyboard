//
//  UIColor+.swift
//  iOS_kronon_okuno_storyboard
//
//  Created by 奥野博貴 on 2021/03/10.
//

import UIKit

extension UIColor {
    
    class func myLightBlue() -> UIColor {
        // #9DDCDC
        let color = UIColor.init(red: 157/255, green: 220/255, blue: 220/255, alpha: 1)
        return color
    }
    
    class func myDarkBlue() -> UIColor {
        // #7EC2C2
        let color = UIColor.init(red: 126/255, green: 194/255, blue: 194/255, alpha: 1)
        return color
    }
    
    class func myLightYellow() -> UIColor {
        // #FFF4E1
        let color = UIColor.init(red: 255/255, green: 244/255, blue: 225/255, alpha: 1)
        return color
    }
    
    class func myLightRed() -> UIColor {
        let color = UIColor.init(red: 240/255, green: 150/255, blue: 122/255, alpha: 0.3)
        return color
    }
    
    class func myDarkGray() -> UIColor {
        // #E67A7A
        let color = UIColor.init(red: 69/255, green: 69/255, blue: 69/255, alpha: 1)
        return color
    }
    
    class func mercury() -> UIColor {
        // EBEBEB
        let color = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        return color
    }
    
    class func defaultBackground() -> UIColor {
        // #FDF7F0
        let color = UIColor.init(red: 253/255, green: 247/255, blue: 240/255, alpha: 1)
        return color
    }
    
    class func sundayBackground() -> UIColor {
        // #FDEDEF
        let color = UIColor.init(red: 253/255, green: 237/255, blue: 239/255, alpha: 1)
        return color
    }
    
    class func saturdayBackground() -> UIColor {
        // #F2F6FD
        let color = UIColor.init(red: 242/255, green: 246/255, blue: 253/255, alpha: 1)
        return color
    }
}
