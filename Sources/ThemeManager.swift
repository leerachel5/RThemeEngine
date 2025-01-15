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
    @Published public var uiUserInterfaceStyle: UIUserInterfaceStyle {
        didSet {
            saveUIUserInterfaceStyleToUserDefaults()
            onUIUserInterfaceStyleChanged()
        }
    }
    
    // MARK: Initializers
    public init(
        theme: Theme? = nil,
        uiUserInterfaceStyle: UIUserInterfaceStyle? = nil
    ) {
        self.theme = theme ?? MainTheme()
        self.uiUserInterfaceStyle = uiUserInterfaceStyle ?? Self.loadUIUserInterfaceStyleFromUserDefaults() ?? .unspecified
        
        NotificationCenter.default.addObserver(self, selector: #selector(windowSceneDidBecomeActive), name: UIWindow.didBecomeKeyNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIWindow.didBecomeKeyNotification, object: nil)
    }
    
    // MARK: User Defaults Helper Methods
    private func saveUIUserInterfaceStyleToUserDefaults() {
        UserDefaults.standard.set(uiUserInterfaceStyle.rawValue.description, forKey: UserDefaultsKey.uiUserInterfaceStyle)
    }
    
    private static func loadUIUserInterfaceStyleFromUserDefaults() -> UIUserInterfaceStyle? {
        if let storedRawValue = UserDefaults.standard.string(forKey: UserDefaultsKey.uiUserInterfaceStyle), let storedRawValueAsInt = Int(storedRawValue) {
           let uiUserInterfaceStyle = UIUserInterfaceStyle(rawValue: storedRawValueAsInt)
            return uiUserInterfaceStyle
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
