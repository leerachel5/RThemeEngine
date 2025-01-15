//
//  ApplyThemeViewModifier.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/12/25.
//

import SwiftUI

struct ApplyThemeViewModifier: ViewModifier {
    let theme: Theme
    
    func body(content: Content) -> some View {
        content
            .background(theme.backgroundColor)
            .foregroundStyle(theme.primaryTextColor, theme.secondaryTextColor)
            .accentColor(theme.accentColor)
    }
}

extension View {
    /// Applies the provided theme to the view, modifying its background color, text color, and accent color.
    /// - Parameter theme: The theme to apply. If no theme is provided, the default `MainTheme` is used.
    /// - Returns: A modified view with the applied theme.
    public func applyTheme(_ theme: Theme = MainTheme()) -> some View {
        return self.modifier(ApplyThemeViewModifier(theme: theme))
    }
}
