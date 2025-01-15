//
//  ThemeManager.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/1/25.
//

import Combine

public class ThemeManager: ObservableObject {
    @Published public var selectedTheme: Theme
    @Published public var colorSchemeMode: ColorSchemeMode
    
    public init(
        theme: Theme = MainTheme(),
        colorSchemeMode: ColorSchemeMode = .system
    ) {
        self.selectedTheme = theme
        self.colorSchemeMode = colorSchemeMode
    }
}
