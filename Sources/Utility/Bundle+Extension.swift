//
//  Bundle+Extension.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/11/25.
//

import Foundation

/// Dummy class used to identify the bundle the framework's resources are located in.
class FrameworkResourceLocator {}

extension Bundle {
    /// Retrieves the current framework's bundle.
    static let rThemeEngineBundle = {
        #if SWIFT_PACKAGE
        Bundle.module
        #else
        Bundle(for: FrameworkResourceLocator.self)
        #endif
    }()
}
