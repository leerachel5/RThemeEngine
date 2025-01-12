//
//  ThemeManager.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/1/25.
//

import Combine

public class ThemeManager: ObservableObject {
    @Published public var selectedTheme: ThemeProtocol
    
    public init(theme: ThemeProtocol = MainTheme()) {
        self.selectedTheme = theme
    }
}
