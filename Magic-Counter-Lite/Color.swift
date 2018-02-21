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
      return UIColor(r: 235, g: 160, b: 136)
    case .green:
        return UIColor(r: 165, g: 215, b: 165)
    case .white:
      return UIColor(r: 235, g: 220, b: 185)
    case .blue:
      return UIColor(r: 130, g: 185, b: 225)
    case .black:
      return UIColor(r: 40, g: 40, b: 40)
    case .colorless:
      return UIColor(r: 175, g: 168, b: 168)
    }
  }
}

extension UIColor {
    
    // Extension on colors to make RGB easier to read
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
