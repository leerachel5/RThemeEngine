//
//  ContentView.swift
//  RThemeEngineExample
//
//  Created by Rachel Lee on 1/1/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    
    var body: some View {
        VStack(spacing: 50) {
            Text("This is some text on a surface.")
                .foregroundStyle(.mainPrimaryText)
                .padding(12)
                .background(.mainSurface)
                .cornerRadius(12)
            Divider().background(.mainDivider)
            VStack {
                Text("This is some primary text.")
                    .foregroundStyle(.mainPrimaryText)
                    .font(.headline)
                Text("And some secondary text.")
                    .foregroundStyle(.mainSecondaryText)
                    .font(.subheadline)
            }
            Divider().background(.mainDivider)
            VStack(spacing: 10) {
                Text("These are buttons.")
                HStack {
                    VStack {
                        Button(action: {}, label: {
                            Text("Click Me!")
                                .padding(10)
                                .background(.mainPrimary)
                                .foregroundColor(.mainPrimaryText)
                                .cornerRadius(12)
                        })
                        Text("Primary")
                            .font(.caption)
                    }
                    VStack {
                        Button(action: {}, label: {
                            Text("Click Me!")
                                .padding(10)
                                .background(.mainSecondary)
                                .foregroundColor(.mainPrimaryText)
                                .cornerRadius(12)
                        })
                        Text("Secondary")
                            .font(.caption)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
