//
//  ColorSchemeMode.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/13/25.
//

import UIKit

public enum ColorSchemeMode: String, CaseIterable, Identifiable {
    case light
    case dark
    case system
    
    public var id: String { self.rawValue }
    
    private var uiUserInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light: .light
        case .dark: .dark
        case .system: .unspecified
        }
    }
    
    /// Applies the color scheme mode to the given window.
    /// - Parameter window: The `UIWindow` instance to which the color scheme mode will be applied.
    func apply(to window: UIWindow) {
        window.overrideUserInterfaceStyle = uiUserInterfaceStyle
    }
}
