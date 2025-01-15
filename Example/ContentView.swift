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
    @State private var showingSettings: Bool = false
    
    private var theme: Theme {
        themeManager.theme
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Text("This is some text on a surface.")
                    .padding(12)
                    .background(theme.surfaceColor)
                    .cornerRadius(12)
                Divider().background(theme.dividerColor)
                VStack {
                    Text("This is some primary text.")
                        .font(.headline)
                    Text("And some secondary text.")
                        .font(.subheadline)
                }
                Divider().background(theme.dividerColor)
                VStack(spacing: 10) {
                    Text("These are buttons.")
                    HStack {
                        VStack {
                            Button(action: {}, label: {
                                Text("Click Me!")
                                    .padding(10)
                                    .background(theme.primaryColor)
                                    .cornerRadius(12)
                            })
                            Text("Primary")
                                .font(.caption)
                        }
                        VStack {
                            Button(action: {}, label: {
                                Text("Click Me!")
                                    .padding(10)
                                    .background(theme.secondaryColor)
                                    .cornerRadius(12)
                            })
                            Text("Secondary")
                                .font(.caption)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    settingsButton
                }
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView(showingSettings: $showingSettings)
                    .presentationDetents([.fraction(0.99)])
            }
        }
    }
    
    // MARK: Toolbar Items
    private var settingsButton: some View {
        Button(action: {
            showingSettings.toggle()
        }) {
            Image(systemName: "gearshape")
        }
        .foregroundStyle(Color.accentColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let themeManager = ThemeManager()
        ContentView()
            .environmentObject(themeManager)
            .applyTheme(themeManager.theme)
    }
}
