//
//  ContentView.swift
//  RThemeEngineExample
//
//  Created by Rachel Lee on 1/1/25.
//

import RThemeEngine
import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    private var theme: ThemeProtocol {
        themeManager.selectedTheme
    }
    
    var body: some View {
        VStack(spacing: 50) {
            Text("This is some text on a surface.")
                .foregroundStyle(theme.primaryTextColor)
                .padding(12)
                .background(theme.surfaceColor)
                .cornerRadius(12)
            Divider().background(theme.dividerColor)
            VStack {
                Text("This is some primary text.")
                    .foregroundStyle(theme.primaryTextColor)
                    .font(.headline)
                Text("And some secondary text.")
                    .foregroundStyle(theme.secondaryTextColor)
                    .font(.subheadline)
            }
            Divider().background(theme.dividerColor)
            VStack(spacing: 10) {
                Text("These are buttons.")
                    .foregroundStyle(theme.primaryTextColor)
                HStack {
                    VStack {
                        Button(action: {}, label: {
                            Text("Click Me!")
                                .padding(10)
                                .background(theme.primaryColor)
                                .foregroundColor(theme.primaryTextColor)
                                .cornerRadius(12)
                        })
                        Text("Primary")
                            .foregroundStyle(theme.primaryTextColor)
                            .font(.caption)
                    }
                    VStack {
                        Button(action: {}, label: {
                            Text("Click Me!")
                                .padding(10)
                                .background(theme.secondaryColor)
                                .foregroundColor(theme.primaryTextColor)
                                .cornerRadius(12)
                        })
                        Text("Secondary")
                            .foregroundStyle(theme.primaryTextColor)
                            .font(.caption)
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let themeManager = ThemeManager()
        ContentView()
            .environmentObject(themeManager)
    }
}
