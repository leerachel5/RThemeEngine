//
//  RThemeEngineExampleApp.swift
//  RThemeEngineExample
//
//  Created by Rachel Lee on 1/1/25.
//

import RThemeEngine
import SwiftUI

@main
struct RThemeEngineExampleApp: App {
    @StateObject var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
        }
    }
}
