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
      return UIColor(r: 179, g: 47, b: 60)
    case .green:
        // FIXME: This green in terrible
        return UIColor(r: 40, g: 231, b: 29)
    case .white:
      return UIColor(r: 231, g: 217, b: 120)
    case .blue:
      return UIColor(r: 57, g: 181, b: 222)
    case .black:
      return UIColor(r: 23, g: 23, b: 23)
    case .colorless:
      return UIColor(r: 145, g: 145, b: 145)
    }
  }
}

extension UIColor {
    
    // Extension on colors to make RGB easier to read
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
