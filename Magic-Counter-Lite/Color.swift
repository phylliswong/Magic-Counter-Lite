//
//  Color.swift
//  Magic-Counter-Lite
//
//  Created by Phyllis Wong on 2/17/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

// Enum keeps colors organized and stores UIColor Values

enum Colors {
  
  // Colors to represent the Magic colors
  case red, green, white, blue, black, colorless
  
  // Return the UIColor color for enum
  // FIXME: The RGB values need work!
  func toUIColor() -> UIColor {
    switch self {
    case .red:
      return UIColor(r: 173, g: 32, b: 52)
    case .green:
        return UIColor(r: 0, g: 143, b: 0)
    case .white:
      return UIColor(r: 231, g: 217, b: 120)
    case .blue:
      return UIColor(r: 47, g: 181, b: 250)
    case .black:
      return UIColor(r: 30, g: 30, b: 30)
    case .colorless:
      return UIColor(r: 109, g: 109, b: 109)
    }
  }
}

extension UIColor {
    
    // Extension on colors to make RGB easier to read
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
