//
//  Theme.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/1/25.
//

import SwiftUI

public struct Theme: Identifiable, Hashable {
    // MARK: Identifiers
    public let name: String
    public var id: String { name }
    
    // MARK: Colors
    public let accentColor: Color
    public let backgroundColor: Color
    public let dividerColor: Color
    public let primaryColor: Color
    public let primaryTextColor: Color
    public let secondaryColor: Color
    public let secondaryTextColor: Color
    public let surfaceColor: Color
}

// MARK: Theme Presets
extension Theme {
    public static let main = Theme(name: "main")
    public static let grayscale = Theme(name: "grayscale")
}

// MARK: Public Initializers
extension Theme {
    public init(name: String = "main") {
        // TODO: Handle color not found in bundle
        self.init(
            name: name,
            accentColor: Color("\(name)AccentColor", bundle: Bundle.rThemeEngineBundle),
            backgroundColor: Color("\(name)BackgroundColor", bundle: Bundle.rThemeEngineBundle),
            dividerColor: Color("\(name)DividerColor", bundle: Bundle.rThemeEngineBundle),
            primaryColor: Color("\(name)PrimaryColor", bundle: Bundle.rThemeEngineBundle),
            primaryTextColor: Color("\(name)PrimaryTextColor", bundle: Bundle.rThemeEngineBundle),
            secondaryColor: Color("\(name)SecondaryColor", bundle: Bundle.rThemeEngineBundle),
            secondaryTextColor: Color("\(name)SecondaryTextColor", bundle: Bundle.rThemeEngineBundle),
            surfaceColor: Color("\(name)SurfaceColor", bundle: Bundle.rThemeEngineBundle)
        )
    }
}
