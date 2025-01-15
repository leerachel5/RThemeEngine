//
//  UIWindow+Extension.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/14/25.
//

import UIKit

extension UIWindow {
    /// Gets the first window in the active window scene.
    static var main: UIWindow? {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return windowScene.windows.first
        }
        return nil
    }
}
