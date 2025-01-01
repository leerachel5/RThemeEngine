//
//  ThemeManager.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/1/25.
//

import Combine

public class ThemeManager: ObservableObject {
    @Published var selectedTheme: ThemeProtocol = MainTheme()
    
    func setTheme(_ theme: ThemeProtocol) {
        selectedTheme = theme
    }
}
