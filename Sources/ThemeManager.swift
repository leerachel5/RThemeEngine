//
//  ThemeManager.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/1/25.
//

import Combine

public class ThemeManager: ObservableObject {
    @Published public var selectedTheme: ThemeProtocol = MainTheme()
    
    public init(theme: ThemeProtocol) {
        self.selectedTheme = theme
    }
    
    public func setTheme(_ theme: ThemeProtocol) {
        selectedTheme = theme
    }
}
