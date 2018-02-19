//
//  Color.swift
//  Magic-Counter-Lite
//
//  Created by mitchell hudson on 2/17/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

// Enum keeps colors organized and stores UIColor Values

enum Colors {
  
  // Colors - Note! Need Colorless for Eldrazi!
  case red, green, white, blue, black, colorless
  
  // Return the UIColor color for enum
  // TODO: The RGB values need work! 
  func toUIColor() -> UIColor {
    switch self {
    case .red:
        // UIColor(red: 179 / 255, green: 47 / 255, blue: 60 / 255, alpha: 1)
      return UIColor(r: 179, g: 47, b: 60)
    case .green:
        // UIColor(red: 40 / 255, green: 231 / 255, blue: 29 / 255, alpha: 1)
        return UIColor(r: 40, g: 231, b: 29)
    case .white:
        // UIColor(red: 231 / 255, green: 217 / 255, blue: 120 / 255, alpha: 1)
      return UIColor(r: 231, g: 217, b: 120)
    case .blue:
        // UIColor(red: 57 / 255, green: 181 / 255, blue: 222 / 255, alpha: 1)
      return UIColor(r: 57, g: 181, b: 222)
    case .black:
        // UIColor(red: 23 / 255, green: 23 / 255, blue: 23 / 255, alpha: 1)
      return UIColor(r: 23, g: 23, b: 23)
    case .colorless:
        // UIColor(red: 145 / 255, green: 145 / 255, blue: 145 / 255, alpha: 1)
      return UIColor(r: 145, g: 145, b: 145)
    }
  }
}

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
