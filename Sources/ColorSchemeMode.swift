//
//  ColorSchemeMode.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/13/25.
//

import SwiftUI

public enum ColorSchemeMode: String, CaseIterable, Identifiable {
    case light
    case dark
    case system
    
    public var id: String { self.rawValue }
    
    public var uiUserInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light: .light
        case .dark: .dark
        case .system: .unspecified
        }
    }
    
    /// Applies the specified color scheme mode (light, dark, or system) to the first window
    /// in the current window scene. This method overrides the app's user interface style
    /// for the window, allowing it to reflect the desired color scheme.
    public func apply() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.overrideUserInterfaceStyle = uiUserInterfaceStyle
            }
        }
    }
}
