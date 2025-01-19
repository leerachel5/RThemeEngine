//
//  ThemeManager.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/1/25.
//

import UIKit

public class ThemeManager: ObservableObject {
    // MARK: Instance Properties
    @Published public var theme: Theme {
        didSet {
            Self.saveThemeToUserDefaults(theme)
        }
    }
    @Published public var uiUserInterfaceStyle: UIUserInterfaceStyle {
        didSet {
            Self.saveUIUserInterfaceStyleToUserDefaults(uiUserInterfaceStyle)
            onUIUserInterfaceStyleChanged()
        }
    }
    
    // MARK: Initializers
    public init(
        theme: Theme? = nil,
        uiUserInterfaceStyle: UIUserInterfaceStyle? = nil
    ) {
        self.theme = theme ?? Self.loadThemeFromUserDefaults() ?? .main
        self.uiUserInterfaceStyle = uiUserInterfaceStyle ?? Self.loadUIUserInterfaceStyleFromUserDefaults() ?? .unspecified
        
        // Listen for window becoming active to apply UI style
        NotificationCenter.default.addObserver(self, selector: #selector(windowSceneDidBecomeActive), name: UIWindow.didBecomeKeyNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIWindow.didBecomeKeyNotification, object: nil)
    }
    
    // MARK: User Defaults Helper Methods
    private static func saveUIUserInterfaceStyleToUserDefaults(_ style: UIUserInterfaceStyle) {
        UserDefaults.standard.set(style.rawValue.description, forKey: UserDefaultsKey.uiUserInterfaceStyle)
    }
    
    private static func loadUIUserInterfaceStyleFromUserDefaults() -> UIUserInterfaceStyle? {
        if let storedRawValue = UserDefaults.standard.string(forKey: UserDefaultsKey.uiUserInterfaceStyle), let storedRawValueAsInt = Int(storedRawValue) {
            return UIUserInterfaceStyle(rawValue: storedRawValueAsInt)
        }
        return nil
    }
    
    private static func saveThemeToUserDefaults(_ theme: Theme) {
        UserDefaults.standard.set(theme.name, forKey: UserDefaultsKey.theme)
        UserDefaults.standard.set(theme.bundle.bundleURL, forKey: UserDefaultsKey.themeBundleURL)
    }
    
    private static func loadThemeFromUserDefaults() -> Theme? {
        if let storedThemeName = UserDefaults.standard.string(forKey: UserDefaultsKey.theme), let storedThemeBundleURL = UserDefaults.standard.url(forKey: UserDefaultsKey.themeBundleURL), let storedThemeBundle = Bundle(url: storedThemeBundleURL) {
            return Theme(name: storedThemeName, bundle: storedThemeBundle)
        }
        return nil
    }
    
    // MARK: Observers
    /// Called every time the `uiUserInterfaceStyle` instance prop is set.
    private func onUIUserInterfaceStyleChanged() {
        if let mainWindow = UIWindow.main {
            uiUserInterfaceStyle.apply(to: mainWindow)
        }
    }
    
    /// Called whenever a window becomes the key window.
    @objc private func windowSceneDidBecomeActive() {
        if let mainWindow = UIWindow.main {
            uiUserInterfaceStyle.apply(to: mainWindow)
        }
    }
}
