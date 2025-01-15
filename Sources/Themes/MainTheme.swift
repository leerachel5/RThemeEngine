//
//  MainTheme.swift
//  RThemeEngine
//
//  Created by Rachel Lee on 1/1/25.
//

import SwiftUI

public struct MainTheme: Theme {
    // MARK: Colors
    public let accentColor = Color("mainAccentColor", bundle: Bundle.rThemeEngineBundle)
    public let backgroundColor = Color("mainBackgroundColor", bundle: Bundle.rThemeEngineBundle)
    public let dividerColor = Color("mainDividerColor", bundle: Bundle.rThemeEngineBundle)
    public let primaryColor = Color("mainPrimaryColor", bundle: Bundle.rThemeEngineBundle)
    public let primaryTextColor = Color("mainPrimaryTextColor", bundle: Bundle.rThemeEngineBundle)
    public let secondaryColor = Color("mainSecondaryColor", bundle: Bundle.rThemeEngineBundle)
    public let secondaryTextColor = Color("mainSecondaryTextColor", bundle: Bundle.rThemeEngineBundle)
    public let surfaceColor = Color("mainSurfaceColor", bundle: Bundle.rThemeEngineBundle)
    
    public init() {}
}
