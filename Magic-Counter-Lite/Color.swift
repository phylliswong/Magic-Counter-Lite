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
  case Red, Green, White, Blue, Black, Colorless
  
  // Return the UIColor color for enum
  // TODO: The RGB values need work! 
  func toUIColor() -> UIColor {
    switch self {
    case .Red:
      return UIColor(red: 179 / 255, green: 47 / 255, blue: 60 / 255, alpha: 1)
    case .Green:
      return UIColor(red: 40 / 255, green: 231 / 255, blue: 29 / 255, alpha: 1)
    case .White:
      return UIColor(red: 231 / 255, green: 217 / 255, blue: 120 / 255, alpha: 1)
    case .Blue:
      return UIColor(red: 57 / 255, green: 181 / 255, blue: 222 / 255, alpha: 1)
    case .Black:
      return UIColor(red: 23 / 255, green: 23 / 255, blue: 23 / 255, alpha: 1)
    case .Colorless:
      return UIColor(red: 145 / 255, green: 145 / 255, blue: 145 / 255, alpha: 1)
    }
  }
}
