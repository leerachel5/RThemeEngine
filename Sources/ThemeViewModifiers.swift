//
//  ThemeViewModifiers.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/12/25.
//

import SwiftUI

struct SetThemeViewModifier: ViewModifier {
    let theme: ThemeProtocol
    
    func body(content: Content) -> some View {
        content
            .background(theme.backgroundColor)
            .foregroundStyle(theme.primaryTextColor, theme.secondaryTextColor)
            .accentColor(theme.accentColor)
    }
}

extension View {
    public func applyThemeManager(_ themeManager: ThemeManager = ThemeManager()) -> some View {
        themeManager.colorSchemeMode.apply()
        return self.modifier(SetThemeViewModifier(theme: themeManager.selectedTheme))
    }
}
