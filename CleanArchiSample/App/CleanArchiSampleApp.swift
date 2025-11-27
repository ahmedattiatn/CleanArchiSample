//
//  CleanArchiSampleApp.swift
//  CleanArchiSample
//
//  Created by Ahmed Atia on 15/11/2025.
//

import SwiftUI

@main
struct CleanArchiSampleApp: App {
    var body: some Scene {
        WindowGroup {
            HomeConfigurator.configureHomeView()
            // .preferredColorScheme(.light) // the app handle the dark mode but we can force the light mode also
        }
    }
}
