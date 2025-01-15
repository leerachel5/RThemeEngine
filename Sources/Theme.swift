//
//  Theme.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/1/25.
//

import SwiftUI

public protocol Theme {
    // MARK: Colors
    var accentColor: Color { get }
    var backgroundColor: Color { get }
    var dividerColor: Color { get }
    var primaryColor: Color { get }
    var primaryTextColor: Color { get }
    var secondaryColor: Color { get }
    var secondaryTextColor: Color { get }
    var surfaceColor: Color { get }
}
