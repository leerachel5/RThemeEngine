//
//  ThemeManager.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/1/25.
//

import UIKit

public class ThemeManager: ObservableObject {
    // MARK: Instance Properties
    @Published public var theme: Theme
    @Published public var colorSchemeMode: ColorSchemeMode {
        didSet {
            saveColorSchemeModeToUserDefaults()
            onColorSchemeChanged()
        }
    }
    
    // MARK: Initializers
    public init(
        theme: Theme? = nil,
        colorSchemeMode: ColorSchemeMode? = nil
    ) {
        self.theme = theme ?? MainTheme()
        self.colorSchemeMode = colorSchemeMode ?? Self.loadColorSchemeModeFromUserDefaults() ?? .system
        
        NotificationCenter.default.addObserver(self, selector: #selector(windowSceneDidBecomeActive), name: UIWindow.didBecomeKeyNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIWindow.didBecomeKeyNotification, object: nil)
    }
    
    // MARK: User Defaults Helper Methods
    private func saveColorSchemeModeToUserDefaults() {
        UserDefaults.standard.set(colorSchemeMode.rawValue, forKey: UserDefaultsKey.colorSchemeMode)
    }
    
    private static func loadColorSchemeModeFromUserDefaults() -> ColorSchemeMode? {
        if let storedRawValue = UserDefaults.standard.string(forKey: UserDefaultsKey.colorSchemeMode),
           let colorSchemeMode = ColorSchemeMode(rawValue: storedRawValue) {
            return colorSchemeMode
        }
        return nil
    }
    
    // MARK: Observers
    /// Called every time the `onColorScheme` instance prop is set.
    private func onColorSchemeChanged() {
        if let mainWindow = UIWindow.main {
            colorSchemeMode.apply(to: mainWindow)
        }
    }
    
    /// Called whenever a window becomes the key window.
    @objc private func windowSceneDidBecomeActive() {
        if let mainWindow = UIWindow.main {
            colorSchemeMode.apply(to: mainWindow)
        }
    }
}
