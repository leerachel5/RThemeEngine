//
//  Theme.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/1/25.
//

import SwiftUI

public struct Theme {
    /// The unique name used to identity the theme.
    public let name: String
    
    /// The bundle where the theme colors are stored.
    let bundle: Bundle
    
    // MARK: Initializers
    public init(name: String = "main", bundle: Bundle) {
        // TODO: Handle color not found in bundle
        self.name = name
        self.bundle = bundle
    }
    
    // MARK: Colors
    public var accentColor: Color { Color("\(name)AccentColor", bundle: bundle) }
    public var backgroundColor: Color { Color("\(name)BackgroundColor", bundle: bundle) }
    public var complementaryTextColor: Color { Color("\(name)ComplementaryTextColor", bundle: bundle) }
    public var dividerColor: Color { Color("\(name)DividerColor", bundle: bundle) }
    public var primaryColor: Color { Color("\(name)PrimaryColor", bundle: bundle) }
    public var primaryTextColor: Color { Color("\(name)PrimaryTextColor", bundle: bundle) }
    public var secondaryColor: Color { Color("\(name)SecondaryColor", bundle: bundle) }
    public var secondaryTextColor: Color { Color("\(name)SecondaryTextColor", bundle: bundle) }
    public var surfaceColor: Color { Color("\(name)SurfaceColor", bundle: bundle) }
}

// MARK: Theme Presets
extension Theme {
    public static let main = Theme(name: "main", bundle: Bundle.rThemeEngineBundle)
    public static let grayscale = Theme(name: "grayscale", bundle: Bundle.rThemeEngineBundle)
}

// MARK: Identifiable & Hashable Conformance
extension Theme: Identifiable, Hashable {
    public var id: String { name }
    
    public static func == (lhs: Theme, rhs: Theme) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
