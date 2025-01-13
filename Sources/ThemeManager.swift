//
//  ThemeManager.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/1/25.
//

import Combine

public class ThemeManager: ObservableObject {
    @Published public var selectedTheme: ThemeProtocol
    @Published public var colorSchemeMode: ColorSchemeMode
    
    public init(
        theme: ThemeProtocol = MainTheme(),
        colorSchemeMode: ColorSchemeMode = .system
    ) {
        self.selectedTheme = theme
        self.colorSchemeMode = colorSchemeMode
    }
}
