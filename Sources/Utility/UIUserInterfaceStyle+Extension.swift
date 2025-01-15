//
//  UIUserInterfaceStyle+Extension.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/14/25.
//

import UIKit

extension UIUserInterfaceStyle {
    public var displayName: String {
        switch self {
        case .light:
            "light"
        case .dark:
            "dark"
        case .unspecified:
            "system"
        default:
            "system"
        }
    }
    
    /// Static property to simulate CaseIterable
    public static let allCases: [UIUserInterfaceStyle] = [
        .light,
        .dark,
        .unspecified
    ]
    
    /// Applies the `UIUserInterfaceStyle` to the given window.
    /// - Parameter window: The `UIWindow` instance to which the color scheme mode will be applied.
    func apply(to window: UIWindow) {
        window.overrideUserInterfaceStyle = self
    }
}

extension UIUserInterfaceStyle: Identifiable {
    public var id: UIUserInterfaceStyle { self }
}
