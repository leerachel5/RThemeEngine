//
//  SettingsView.swift
//  RThemeEngineExample
//
//  Created by Rachel Lee on 1/14/25.
//

import RThemeEngine
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @Binding var showingSettings: Bool
    
    private var theme: Theme { themeManager.theme }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(
                    header:
                        Text("General Settings")
                        .foregroundStyle(.secondary)
                ) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Appearance")
                            .foregroundStyle(.secondary)
                            .font(.subheadline)
                        Picker("UI User Interface Style", selection: $themeManager.uiUserInterfaceStyle) {
                            ForEach(UIUserInterfaceStyle.allCases) { style in
                                Text(style.displayName).tag(style)
                            }
                        }
                        .pickerStyle(.palette)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    cancelButton
                }
                ToolbarItem(placement: .confirmationAction) {
                    doneButton
                }
            }
        }
    }
    
    // MARK: Toolbar Items
    private var cancelButton: some View {
        Button("Cancel") {
            showingSettings = false
        }
        .foregroundStyle(Color.accentColor)
    }
    
    private var doneButton: some View {
        Button("Done") {
            showingSettings = false
        }
        .foregroundStyle(Color.accentColor)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let themeManager = ThemeManager()
        SettingsView(showingSettings: .constant(true))
            .environmentObject(themeManager)
            .applyTheme(themeManager.theme)
    }
}
