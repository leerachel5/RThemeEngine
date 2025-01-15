//
//  ThemeViewModifiers.swift
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
    public func applyTheme(_ theme: Theme = MainTheme()) -> some View {
        return self.modifier(ApplyThemeViewModifier(theme: theme))
    }
}
